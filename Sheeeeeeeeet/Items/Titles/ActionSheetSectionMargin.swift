//
//  ActionSheetSectionMargin.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Section margins items can be used to add additional spacing
 before new sections. They are not selectable, but will send
 a tap event to the action sheet in which they are used.
 
 */

import UIKit

open class ActionSheetSectionMargin: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init() {
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetSectionMarginCell(style: cellStyle, reuseIdentifier: cellReuseIdentifier)
    }
}


// MARK: -

open class ActionSheetSectionMarginCell: ActionSheetItemCell {}
