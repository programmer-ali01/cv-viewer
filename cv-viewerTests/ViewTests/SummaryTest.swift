//
//  SummaryTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/27/22.
//

import Foundation

import XCTest
@testable import cv_viewer

class SummaryTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    struct CVSummary: Codable {
        let summary: String
    }
    
    func testCanParse() throws {
        let json = """
          {
            "summary": "A self-taught programmer and an enthusiast of the iOS ecosystem. Through self-teaching, I have gained knowledge of iOS programming, and I am able to build iOS applications fully programmatically. Furthermore, I understand design patterns, and agile methodologies. Currently, I am pursuing a career as an iOS developer and I am eager to secure a role within a suitable team."
          }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(CVSummary.self, from: data)
        
        let text = "A self-taught programmer and an enthusiast of the iOS ecosystem. Through self-teaching, I have gained knowledge of iOS programming, and I am able to build iOS applications fully programmatically. Furthermore, I understand design patterns, and agile methodologies. Currently, I am pursuing a career as an iOS developer and I am eager to secure a role within a suitable team."
        
        XCTAssertEqual(result.summary, text)
        
        
    }
}

