//
//  ActionSheetMenuOption.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-08-13.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
This enum specifies the different kind of demo action sheets
that can be opened from the main menu.
*/
enum ActionSheetMenuOption {
    
    case
    danger,
    collections,
    customView,
    headerView,
    links,
    multiSelect,
    nonDismissable,
    sections,
    singleSelect,
    standard
    
    var title: String {
        switch self {
        case .collections: return "Collection Sheet"
        case .customView: return "Custom View Sheet"
        case .danger: return "Destructive Sheet"
        case .headerView: return "Header Sheet"
        case .links: return "Link Sheet"
        case .multiSelect: return "Multi-Select Sheet"
        case .nonDismissable: return "Non-Dismissable Sheet"
        case .sections: return "Section Sheet"
        case .singleSelect: return "Single-Select Sheet"
        case .standard: return "Standard Sheet"
        }
    }
    
    var description: String {
        switch self {
        case .collections: return "Open an action sheet with a collections view."
        case .customView: return "Open an action sheet with a custom view."
        case .danger: return "Open an action sheet with a destructive action."
        case .headerView: return "Open an action sheet with a custom header view."
        case .links: return "Open an action sheet with links."
        case .multiSelect: return "Open a multi-select action sheet."
        case .nonDismissable: return "Open an action sheet that can't be dismissed by tapping outside the sheet."
        case .sections: return "Open an action sheet with multiple sections."
        case .singleSelect: return "Open a single-select action sheet."
        case .standard: return "Open a standard action sheet."
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .collections: return "ic_view_module"
        case .customView: return "ic_custom"
        case .danger: return "ic_warning"
        case .headerView: return "ic_header_view"
        case .links: return "ic_arrow_right"
        case .multiSelect: return "ic_checkmarks"
        case .sections: return "ic_sections"
        case .singleSelect: return "ic_checkmark"
        case .standard: return "ic_list"
        case .nonDismissable: return "ic_list"
        }
    }
}
