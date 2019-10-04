//
//  AppearanceMenuOption.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-08-13.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This enum specifies menu options that are listed in the app.
 */
enum AppearanceMenuOption {
    
    case
    demo,
    demoColorful
    
    var title: String {
        switch self {
        case .demo: return "Standard Appearance"
        case .demoColorful: return "Colorful Appearance"
        }
    }
    
    var description: String {
        switch self {
        case .demo: return "Apply the standard appearance"
        case .demoColorful: return "Apply a colorful demo appearance"
        }
    }
    
    var image: UIImage? {
        return nil
    }
}
