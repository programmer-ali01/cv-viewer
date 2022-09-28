//
//  HeadlineTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/27/22.
//

import XCTest
@testable import cv_viewer

class HeadlineTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
          {
            "myName": "Alisena Mudaber",
            "address": "London",
            "phone": "07736148654",
            "email": "alisenamudaber@gmail.com",
            "github": " https://github.com/programmer-ali01"
          }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(HeadlineDetails.self, from: data)
        
        XCTAssertEqual(result.myName, "Alisena Mudaber")
        XCTAssertEqual(result.address, "London")
        XCTAssertEqual(result.phone, "07736148654")
        XCTAssertEqual(result.email, "alisenamudaber@gmail.com")
        XCTAssertEqual(result.github, " https://github.com/programmer-ali01")
        
    }
}

