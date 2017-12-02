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
    peekPop,
    peekPopHeader,
    peekPopSheet
    
    
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
        case .peekPopHeader: return "Peek & Pop: Show Header"
        case .peekPopSheet: return "Peek & Pop: Show Full Sheet"
        }
    }
    
    
    var alertMessage: String {
        switch self {
        case .peekPop: return "Use 3D Touch to peek and pop an action sheet. Long press if your device does not have 3D Touch."
        case .peekPopHeader: return "You can now only peek action sheets with a header view."
        case .peekPopSheet: return "You can now peek all action sheets in the list."
        default: return ""
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .standard: return "ic_list"
        case .singleSelect: return "ic_checkmark"
        case .multiSelect: return "ic_checkmarks"
        case .toggle: return "ic_circle_checked"
        case .links: return "ic_arrow_right"
        case .sections: return "ic_sections"
        case .danger: return "ic_warning"
        case .headerView: return "ic_header_view"
        case .peekPop: return "ic_peek"
        case .peekPopHeader: return "ic_peek"
        case .peekPopSheet: return "ic_peek"
        }
    }
}
