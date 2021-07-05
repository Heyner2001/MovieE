//
//  FontExtension.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 4/07/21.
//

import UIKit

// Font extension
enum FontSize: CGFloat {
    case mini, small, normal, large, xLarge, xxLarge, xxxLarge, huge, giant
    
    var value: CGFloat {
        switch self {
        case .mini:
            // 10 (pixels) // width: 375
            return 10
        case .small:
            // 12 (pixels) // width: 375
            return 12
        case .normal:
            // 14 (pixels) // width: 375
            return 14
        case .large:
            // 16 (pixels) // width: 375
            return 16
        case .xLarge:
            // 18 (pixels) // width: 375
            return 18
        case .xxLarge:
            // 20 (pixels) // width: 375
            return 20
        case .xxxLarge:
            // 28 (pixels) // width: 375
            return 28
        case .huge:
            // 32 (pixels) // width: 375
            return 32
        case .giant:
            // 48 (pixels) // width: 375
            return 48
        }
    }
}

enum FontWeight: String {
    
    case bold = "AppleSDGothicNeo-Bold"
    case semiBold = "AppleSDGothicNeo-SemiBold"
    case medium = "AppleSDGothicNeo-Medium"
    case regular = "AppleSDGothicNeo-Regular"
}

extension UIFont {
    class func setFont(_ weight: FontWeight, _ size: FontSize) -> UIFont {
        return UIFont(name: weight.rawValue, size: size.value)!
    }
}
