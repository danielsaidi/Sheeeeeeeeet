//
//  ActionSheetSectionMargin.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Section margins items can be used to add additional spacing
 before new sections.
 
 Margins are not selectable, but they do send a tap event to
 the action sheet in which they are used. Just to ignore the
 tap events of these item types.
 */
open class ActionSheetSectionMargin: ActionSheetItem {
    
    public init() {
        super.init(title: "", tapBehavior: .none)
    }
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetSectionMarginCell(style: cellStyle, reuseIdentifier: cellReuseIdentifier)
    }
}

open class ActionSheetSectionMarginCell: ActionSheetItemCell {}
