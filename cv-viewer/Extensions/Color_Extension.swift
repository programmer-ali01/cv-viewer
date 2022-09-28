//
//  Color_Extension.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/19/22.
//


import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
               return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
           }
    
    static let darkBlueGray = UIColor.rgb(red: 87, green: 93, blue: 144)
    static let ashGrey = UIColor.rgb(red: 175, green: 191, blue: 192)
    static let aliceBlue = UIColor.rgb(red: 227, green: 235, blue: 236)
}
