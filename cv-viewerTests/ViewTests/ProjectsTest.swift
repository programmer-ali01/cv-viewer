//
//  ProjectsTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/27/22.
//

import Foundation

import XCTest
@testable import cv_viewer

class ProjectsTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
          
               {
                 "name": "Foodie",
                 "description": "A food ordering app, similar to UberEATS. Programmatic and custom views. MVVM design pattern.",
                 "link": "https://github.com/programmer-ali01/Foodie"
               }
          
          
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(ProjectDetails.self, from: data)
        
        let descriptionText = "A food ordering app, similar to UberEATS. Programmatic and custom views. MVVM design pattern."
        
        XCTAssertEqual(result.name, "Foodie")
        XCTAssertEqual(result.description, descriptionText)
        XCTAssertEqual(result.link, "https://github.com/programmer-ali01/Foodie")
    
        
    }
}
