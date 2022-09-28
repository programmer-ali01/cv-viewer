//
//  HeadlineViewControllerTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

import XCTest

@testable import cv_viewer

class HeadlinViewControllerTest: XCTestCase {
    var vc: HeadlineViewController!
    var mockManager: MockProfileManager!

    class MockProfileManager: HeadlineManageable {
        var headline: Headline?
        var error: NetworkError?
        
        func fetchHeadline(completion: @escaping (Result<Headline, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            let headline = Headline(headline: HeadlineDetails(myName: "firstName", address: "lastName", phone: "12345", email: "a@mail.com", github: "fdafdfdf"))

            completion(.success(headline))
        }
    }

    override func setUp() {
        super.setUp()
        vc = HeadlineViewController()
        mockManager = MockProfileManager()
        vc.headlineManager = mockManager

    }

    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", titleAndMessage.1)
    }

    func testTitleAndMessageForNetworkError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Network Error", titleAndMessage.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessage.1)
    }

    func testAlertForServerError() throws  {
        mockManager.error = NetworkError.serverError
        vc.forceFetchHeadline()

        XCTAssertEqual("Server Error", vc.hvc.errorAlert.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", vc.hvc.errorAlert.message)
    }

    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        vc.forceFetchHeadline()

        XCTAssertEqual("Network Error", vc.hvc.errorAlert.title)
        XCTAssertEqual("We could not process your request. Please try again.", vc.hvc.errorAlert.message)
    }
}
