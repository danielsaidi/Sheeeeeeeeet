//
//  ActionSheetItemTapStyle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public enum ActionSheetItemTapStyle {

    case normal, dismiss
    
    var dismissOnTap: Bool {
        switch self {
        case .dismiss: return true
        default: return false
        }
    }
}
