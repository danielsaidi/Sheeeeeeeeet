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
    danger,
    headerView,
    peekPop
    
    var displayName: String {
        switch self {
        case .standard: return "Standard"
        case .singleSelect: return "Single-select"
        case .multiSelect: return "Multi-select"
        case .toggle: return "Toggle Options"
        case .links: return "Links"
        case .sections: return "Sections"
        case .danger: return "Destructive Action"
        case .headerView: return "Header View"
        case .peekPop: return "Peek & Pop"
        }
    }
    
    var alertMessage: String {
        switch self {
        case .peekPop: return "Use 3D touch to preview an action sheet"
        default: return ""
        }
    }
}
