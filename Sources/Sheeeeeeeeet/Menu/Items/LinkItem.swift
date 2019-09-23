//
//  LinkItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A link items can be used when tapping it will take the user
 somewhere, e.g. to another view controller or a web site.
 */
open class LinkItem: MenuItem {
    
    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetLinkItemCell(style: actionSheetCellStyle)
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetLinkItemCell.self
    }
}
