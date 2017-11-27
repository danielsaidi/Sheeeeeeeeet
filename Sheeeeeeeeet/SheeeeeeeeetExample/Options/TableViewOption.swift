//
//  TableViewOption.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

// This enum is only used to populate our example table view.

import UIKit

enum TableViewOption {
    
    case
    standard,
    singleSelect,
    singleSelectPreselected,
    multiSelect,
    multiSelectPreselected
    
    var displayName: String {
        switch self {
        case .standard: return "Standard sheet"
        case .singleSelect: return "Single-select sheet"
        case .singleSelectPreselected: return "Single-select sheet (preselected)"
        case .multiSelect: return "Multi-select sheet"
        case .multiSelectPreselected: return "Multi-select sheet (preselected)"
        }
    }
}
