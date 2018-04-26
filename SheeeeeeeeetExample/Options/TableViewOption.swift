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
    collections,
    headerView,
    links,
    multiSelect,
    peekPopHeader,
    peekPopSheet,
    sections,
    select,
    singleSelect,
    standard,
    standardNonDismissable
    
    
    var title: String {
        switch self {
        case .collections: return "Collections"
        case .danger: return "Destructive Action"
        case .headerView: return "Header View"
        case .links: return "Links"
        case .multiSelect: return "Multi-select items"
        case .peekPopHeader: return "Peek & Pop: Show Header"
        case .peekPopSheet: return "Peek & Pop: Show Full Sheet"
        case .sections: return "Sections"
        case .select: return "Select items"
        case .singleSelect: return "Single-select items"
        case .standard: return "Standard items"
        case .standardNonDismissable: return "Standard items non-dismissable"
        }
    }
    
    var description: String {
        switch self {
        case .collections: return "Show a sheet with horizontal collections items."
        case .danger: return "Show a sheet with a destructive action."
        case .headerView: return "Show a sheet with a custom header view."
        case .links: return "Show a sheet with links."
        case .multiSelect: return "Show a sheet where you can select multiple values."
        case .peekPopHeader: return "Setup the app to only peek header views."
        case .peekPopSheet: return "Setup the app to peek entire sheets."
        case .sections: return "Show a sheet where items are divided in sections."
        case .select: return "Show a sheet where selected items are highlighted."
        case .singleSelect: return "Show a sheet where you can select a single value."
        case .standard: return "Show a sheet where you can pick a single option."
        case .standardNonDismissable: return "Same as tandard, but you cannot dismiss it with tap outside."
        }
    }
    
    var alertTitle: String? {
        switch self {
        case .peekPopHeader: return "You can now only peek sheets with a header view."
        case .peekPopSheet: return "You can now peek all sheets in the list."
        default: return nil
        }
    }
    
    var alertMessage: String? {
        switch self {
        case .peekPopHeader, .peekPopSheet: return "Use 3D Touch to peek and pop action sheets. Long press if your device does not have 3D Touch."
        default: return nil
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .collections: return "ic_view_module"
        case .danger: return "ic_warning"
        case .headerView: return "ic_header_view"
        case .links: return "ic_arrow_right"
        case .multiSelect: return "ic_checkmarks"
        case .peekPopHeader: return "ic_peek"
        case .peekPopSheet: return "ic_peek"
        case .sections: return "ic_sections"
        case .select: return "ic_checkmark"
        case .singleSelect: return "ic_checkmark"
        case .standard: return "ic_list"
        case .standardNonDismissable: return "ic_list"
        }
    }
}
