//
//  ViewModel.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/27/22.
//

import Foundation

struct HeadlineViewModel {
    let fullName: String
    let address: String
    let phone: String
    let email: String
    let link: String
}

struct SummaryViewModel {
    let summary: String
}

struct ProjectsViewModel {
    let projectName: String
    let projectDesc: String
    let projectLink: String
}

struct SkillsViewModel {
    let skillLabel: String
}

struct EducationViewModel {
    let date: String
    let subject: String
    let place: String
    let description: String
}

struct ExperienceViewModel {
    let date: String
    let role: String
    let company: String
    let description: String
}
