//
//  MenuOption.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
This enum specifies menu options that are listed in the demo.
*/
enum MenuOption {
    
    case
    applyAppearance(_ type: AppearanceMenuOption),
    openSheet(_ type: ActionSheetMenuOption),
    separator
    
    var title: String {
        switch self {
        case .applyAppearance(let type): return type.title
        case .openSheet(let type): return type.title
        case .separator: return ""
        }
    }
    
    var description: String {
        switch self {
        case .applyAppearance(let type): return type.description
        case .openSheet(let type): return type.description
        case .separator: return ""
        }
    }
    
    var image: UIImage? {
        switch self {
        case .applyAppearance(let type): return type.image
        case .openSheet(let type): return type.image
        case .separator: return nil
        }
    }
}
