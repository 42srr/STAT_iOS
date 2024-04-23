//
//  UIScreen.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import Foundation
import SwiftUI

extension UIScreen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    
    static func getWidth(_ width: CGFloat) -> CGFloat {
        screenWidth / 390 * width
    }
    
    static func getHeight(_ height: CGFloat) -> CGFloat {
        screenHeight / 844 * height
    }
}
