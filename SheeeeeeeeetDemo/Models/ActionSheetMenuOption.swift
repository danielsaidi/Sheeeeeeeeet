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
    secondaryAction,
    sections,
    singleSelect,
    standard
    
    var title: String {
        switch self {
        case .collections: return "Collections"
        case .customView: return "Custom Views"
        case .danger: return "Destructive Actions"
        case .headerView: return "Header Views"
        case .links: return "Links"
        case .multiSelect: return "Multi-Select Items"
        case .nonDismissable: return "Non-Dismissable Sheets"
        case .secondaryAction: return "Secondary Actions"
        case .sections: return "Sections"
        case .singleSelect: return "Single-Select Items"
        case .standard: return "Standard Items"
        }
    }
    
    var description: String {
        switch self {
        case .collections: return "Open a collection-based sheet."
        case .customView: return "Open a sheet with a custom view."
        case .danger: return "Open a sheet with a destructive action."
        case .headerView: return "Open a sheet with a header view."
        case .links: return "Open a sheet with links."
        case .multiSelect: return "Open a multi-select sheet."
        case .nonDismissable: return "Open a sheet that can't be dismissed by tapping outside the sheet."
        case .secondaryAction: return "Open a sheet where the items have secondary actions"
        case .sections: return "Open a sheet with multiple sections."
        case .singleSelect: return "Open a single-select sheet."
        case .standard: return "Open a sheet with standard items."
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
        case .secondaryAction: return "ic_secondary_action"
        case .sections: return "ic_sections"
        case .singleSelect: return "ic_checkmark"
        case .standard: return "ic_list"
        case .nonDismissable: return "ic_list"
        }
    }
}
