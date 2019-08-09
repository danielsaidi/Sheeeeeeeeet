//
//  UIColor+Example.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var demoText: UIColor { resolveColor(.text) }
    
    static var exampleBlue: UIColor { return UIColor(hex: 0x0FA2F5) }
    static var exampleGreen: UIColor { return UIColor(hex: 0x81c03f) }
    static var examplePink: UIColor { return UIColor(hex: 0xec5f72) }
    static var examplePurple: UIColor { return UIColor(hex: 0xd9007b) }
    static var exampleRed: UIColor { return UIColor(hex: 0xff3333) }
    
    static func resolveColor(_ color: DemoColor) -> UIColor {
        return color.color
    }
}
