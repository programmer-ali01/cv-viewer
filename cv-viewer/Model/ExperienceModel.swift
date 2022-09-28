//
//  ExperienceModel.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

struct Experience: Codable {
    let experience: [Roles]
}

struct Roles: Codable {
    let date: String
    let role: String
    let company: String
    let description: [String]
}
