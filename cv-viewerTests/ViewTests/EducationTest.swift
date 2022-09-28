//
//  EducationTest.swift
//  cv-viewerTests
//
//  Created by Alisena Mudaber on 9/27/22.
//

import Foundation

import XCTest
@testable import cv_viewer

class EducationTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
          {
           "date": "10/2019 - CURRENT",
           "subject": "BSC COMPUTING",
           "place": "Birkbeck, University of London",
           "description": "Currently starting 3rd year of a 4-year programme in October. Classes are in the evenings (6pm – 9m)."
          }
          
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(DegreeDetails.self, from: data)
        
        let text = "Currently starting 3rd year of a 4-year programme in October. Classes are in the evenings (6pm – 9m)."
    
        
        XCTAssertEqual(result.date, "10/2019 - CURRENT")
        XCTAssertEqual(result.subject, "BSC COMPUTING")
        XCTAssertEqual(result.place, "Birkbeck, University of London")
        XCTAssertEqual(result.description, text)
    
        
    }
}
