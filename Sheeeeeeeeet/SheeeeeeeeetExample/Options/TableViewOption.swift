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
    multiSelect,
    toggle,
    links,
    sections,
    danger
    
    var displayName: String {
        switch self {
        case .standard: return "Standard"
        case .singleSelect: return "Single-select"
        case .multiSelect: return "Multi-select"
        case .toggle: return "Toggle options"
        case .links: return "Links"
        case .sections: return "Sections"
        case .danger: return "Destructive action"
        }
    }
}
