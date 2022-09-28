//
//  ProjectModel.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation


struct Projects: Codable {
    let projects: [ProjectDetails]
}

struct ProjectDetails: Codable {
    let name: String
    let description: String
    let link: String
}


