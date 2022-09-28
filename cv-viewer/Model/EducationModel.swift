//
//  EducationModel.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

struct Education: Codable {
    let education: [DegreeDetails]
}

struct DegreeDetails: Codable {
    let date: String
    let subject: String
    let place: String
    let description: String
}
