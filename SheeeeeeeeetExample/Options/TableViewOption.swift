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
    sections,
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
        case .sections: return "Sections"
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
        case .sections: return "Show a sheet where items are divided in sections."
        case .singleSelect: return "Show a sheet where you can select a single value."
        case .standard: return "Show a sheet where you can pick a single option."
        case .standardNonDismissable: return "Same as tandard, but you cannot dismiss it with tap outside."
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
        case .sections: return "ic_sections"
        case .singleSelect: return "ic_checkmark"
        case .standard: return "ic_list"
        case .standardNonDismissable: return "ic_list"
        }
    }
}
