//
//  ActionSheetTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Title items can be used to add main titles to action sheets.
 They are not selectable, but will still send a tap event to
 the action sheet in which they are used.
 
 */

import UIKit

open class ActionSheetTitle: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(title: title, tapBehavior: .none)
    }
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetTitleCell(style: cellStyle, reuseIdentifier: cellReuseIdentifier)
    }
}


// MARK: -

open class ActionSheetTitleCell: ActionSheetItemCell {
    
    open override func refresh() {
        super.refresh()
        textLabel?.textAlignment = .center
    }
}
