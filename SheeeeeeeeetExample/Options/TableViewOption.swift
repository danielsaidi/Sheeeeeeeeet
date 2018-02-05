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
    danger,
    headerView,
    links,
    multiSelect,
    peekPop,
    peekPopHeader,
    peekPopSheet,
    sections,
    singleSelect,
    standard,
    toggle
    
    
    var title: String {
        switch self {
        case .danger: return "Destructive Action"
        case .headerView: return "Header View"
        case .links: return "Links"
        case .multiSelect: return "Multi-select"
        case .peekPop: return "Peek & Pop: Instructions"
        case .peekPopHeader: return "Peek & Pop: Show Header"
        case .peekPopSheet: return "Peek & Pop: Show Full Sheet"
        case .sections: return "Sections"
        case .singleSelect: return "Single-select"
        case .standard: return "Standard"
        case .toggle: return "Toggle Options"
        }
    }
    
    var description: String {
        switch self {
        case .danger: return "Show a sheet with a destructive action."
        case .headerView: return "Show a sheet with a custom header view."
        case .links: return "Show a sheet with links."
        case .multiSelect: return "Show a sheet where you can select multiple values."
        case .peekPop: return "Use 3D Touch to peek and pop an action sheet. Long press if your device does not have 3D Touch."
        case .peekPopHeader: return "Tap this row setup the app to only show the header view of a sheet when peeking."
        case .peekPopSheet: return "Tap this row setup the app to show the entire sheet when peeking."
        case .sections: return "Show a sheet where items are separated into sections."
        case .singleSelect: return "Show a sheet where you can select a single value."
        case .standard: return "Show a sheet where you can pick one of multiple options."
        case .toggle: return "Show a sheet where you can toggle multiple values."
        }
    }
    
    
    var alertMessage: String? {
        switch self {
        case .peekPopHeader: return "You can now only peek action sheets with a header view."
        case .peekPopSheet: return "You can now peek all action sheets in the list."
        default: return nil
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .danger: return "ic_warning"
        case .headerView: return "ic_header_view"
        case .links: return "ic_arrow_right"
        case .multiSelect: return "ic_checkmarks"
        case .peekPop: return "ic_peek"
        case .peekPopHeader: return "ic_peek"
        case .peekPopSheet: return "ic_peek"
        case .sections: return "ic_sections"
        case .singleSelect: return "ic_checkmark"
        case .standard: return "ic_list"
        case .toggle: return "ic_circle_checked"
        }
    }
}
