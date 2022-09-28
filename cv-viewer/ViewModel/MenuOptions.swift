//
//  MenuOptions.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/21/22.
//

import Foundation

enum MenuOptions: String, CaseIterable {
    case home = "Home"
    case header = "Header"
    case summary = "Summary"
    case projects = "Projects"
    case skills = "Skills"
    case education = "Education"
    case experience = "Experience"
    
    var menuIcon: String {
        switch self {
        case .home:
            return "house"
        
        case .header:
            return "list.dash.header.rectangle"
        
        case .summary:
            return "text.justify.leading"
            
        case .projects:
            return "doc.badge.gearshape.fill"
        
        case .skills:
            return "chevron.left.forwardslash.chevron.right"
        
        case .education:
            return "graduationcap.fill"
        
        case .experience:
            return "latch.2.case"
        
        }
    }
}
