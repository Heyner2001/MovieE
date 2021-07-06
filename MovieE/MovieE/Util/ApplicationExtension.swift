//
//  ApplicationExtension.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

extension UIApplication {
    static var sharedKeyWindow: UIWindow {
        return UIApplication.shared.connectedScenes.map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.first ?? UIWindow()
    }
    
    static var statusBarHeight: CGFloat {
        return sharedKeyWindow.windowScene?.statusBarManager?.statusBarFrame.height ?? .zero
    }
}
