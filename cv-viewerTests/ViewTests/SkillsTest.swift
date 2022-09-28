//
//  SkillsTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/27/22.
//

import Foundation

import XCTest
@testable import cv_viewer

class SkillsTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    
    func testCanParse() throws {
        let json = """
          {
               
                    "skills": [
                        "Swift 5",
                        "XCode IDE",
                        "UIKit",
                        "Storyboards/nibs",
                        "Programmatic-UI",
                        "Core Data",
                        "SwiftUI",
                        "Git & GitHub",
                        "MVC & MVMM",
                        "SOLID Principles",
                        "React.js",
                        "Firebase",
                        "RESTful APIs"
                    ]
        }
               
          
          
        """
        let dataString = ["Swift 5",
                            "XCode IDE",
                            "UIKit",
                            "Storyboards/nibs",
                            "Programmatic-UI",
                            "Core Data",
                            "SwiftUI",
                            "Git & GitHub",
                            "MVC & MVMM",
                            "SOLID Principles",
                            "React.js",
                            "Firebase",
                            "RESTful APIs"]
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Skills.self, from: data)
        
       
    
        
        XCTAssertEqual(result.skills, dataString)
        
    
        
    }
}
