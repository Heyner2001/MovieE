//
//  ColorExtension.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 4/07/21.
//

import UIKit

extension UIColor {
    
    class func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor {
        let red: CGFloat = r / 255
        let green: CGFloat = g / 255
        let blue: CGFloat = b / 255
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
