//
//  HeadlineModel.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/28/22.
//

import Foundation

struct Headline: Codable {
    let headline: HeadlineDetails
}

struct HeadlineDetails: Codable {
    let myName: String
    let address: String
    let phone: String
    let email: String
    let github: String
}
