//
//  ExperienceTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

import XCTest
@testable import cv_viewer

class ExperienceTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
               {
                  "date": "PRESENT",
                  "role": "Warehouse Member",
                  "company": "Ocado Zoom",
                  "description": [
                    "Work on different sections of the warehouse",
                    "Complete specific tasks each day",
                    "Collaborating with team members",
                    "Manage inventory",
                    "Complete tasks in an efficient and timely manner"
                  ]
                }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Roles.self, from: data)
        
        let descriptionArray = [
            "Work on different sections of the warehouse",
            "Complete specific tasks each day",
            "Collaborating with team members",
            "Manage inventory",
            "Complete tasks in an efficient and timely manner"
        ]
    
        
        XCTAssertEqual(result.date, "PRESENT")
        XCTAssertEqual(result.role, "Warehouse Member")
        XCTAssertEqual(result.company, "Ocado Zoom")
        XCTAssertEqual(result.description, descriptionArray)
    
        
    }
}
