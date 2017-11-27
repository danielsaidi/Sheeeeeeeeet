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
    sections
    
    var displayName: String {
        switch self {
        case .standard: return "Standard action sheet"
        case .singleSelect: return "Single-select action sheet"
        case .multiSelect: return "Multi-select action sheet"
        case .toggle: return "Toggle action sheet"
        case .sections: return "Section divided action sheet"
        }
    }
}
