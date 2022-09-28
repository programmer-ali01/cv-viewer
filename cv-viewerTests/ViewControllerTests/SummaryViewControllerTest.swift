//
//  HeaderViewControllerTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/27/22.
//

import Foundation

import XCTest

@testable import cv_viewer

class SummaryViewControllerTest: XCTestCase {
    var vc: SummaryViewController!
    var mockManager: MockProfileManager!

    class MockProfileManager: SummaryManageable {
        var summary: Summary?
        var error: NetworkError?


        
        func fetchSummary(completion: @escaping (Result<Summary, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            let summary = Summary(summary: "hello")

            completion(.success(summary))
        }
    }

    override func setUp() {
        super.setUp()
        vc = SummaryViewController()
        mockManager = MockProfileManager()
        vc.summaryManager = mockManager

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
        vc.forceFetchSummary()

        XCTAssertEqual("Server Error", vc.hvc.errorAlert.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", vc.hvc.errorAlert.message)
    }

    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        vc.forceFetchSummary()

        XCTAssertEqual("Network Error", vc.hvc.errorAlert.title)
        XCTAssertEqual("We could not process your request. Please try again.", vc.hvc.errorAlert.message)
    }
}
