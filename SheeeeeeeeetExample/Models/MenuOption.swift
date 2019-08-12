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
    openSheet(_ type: ActionSheetMenuOption)
    
    
    var title: String {
        switch self {
        case .openSheet(let type): return type.title
        }
    }
    
    var description: String {
        switch self {
        case .openSheet(let type): return type.description
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .openSheet(let type): return type.imageName
        }
    }
}
