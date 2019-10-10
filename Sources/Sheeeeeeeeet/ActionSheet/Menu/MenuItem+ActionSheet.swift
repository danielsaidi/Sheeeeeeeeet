//
//  MenuItem+ActionSheetItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/**
 
 These extensions are used to convert menu item instances to
 action sheet cells.
 
 Since `Menu` and `MenuItem` mustn't know about `ActionSheet`
 and `ActionSheetCell`, this logic can't be specified in the
 menu classes. Instead, implementing them as objc extensions
 lets us define standard behaviors that can be overridden.
 
 `IMPORTANT` Every custom menu item you create must override
 `actionSheetCell(for:)` and `actionSheetCellType` for it to
 use a custom cell. Read more below.
 
 */

import UIKit

extension MenuItem {
    
    /**
     Returns the table view cell to use in the action sheet.
     
     `IMPORTANT` You must override this function if you want
     a custom menu item class to use a custom cell type.
     */
    @objc open func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetItemCell(style: actionSheetCellStyle)
    }
    
    /**
     Returns the height of the table view cell.
     
     The function resolves the height by recursively looking
     at the `.appearance().height` value for the item. If no
     value is set, it works its way up the inheritance chain
     until it finds one. This is needed since the appearance
     proxy only returns what is explicitly set for each type.
     
     Instead of overriding the function, you should register
     `MyItemType.appearance().height` for your custom types.
     */
    @objc open var actionSheetCellHeight: Double {
        resolveHeight(for: actionSheetCellType)
    }
    
    /**
     Returns the preferred action sheet cell style.
     */
    @objc open var actionSheetCellStyle: UITableViewCell.CellStyle {
        let hasSubtitle = subtitle != nil
        return hasSubtitle ? .subtitle : .default
    }
    
    /**
     Returns the table view cell type to use when converting
     the item to an action sheet item cell.
     
     `IMPORTANT` You must override this function if you want
     a custom menu item class to use a custom cell type. The
     result is used to calculate the cell height.
     */
    @objc open var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetItemCell.self
    }
}

private extension MenuItem {
    
    /**
     This function is used to recursively resolve the height
     of a certain action sheet item cell type.
     
     This function is needed, since `appearance().height` is
     `0` for each `ActionSheetItemCell.Type` that hasn't had
     its `height` value explicitly set. It will work its way
     up the type hierarchy and return the first height value
     it finds.
     */
    func resolveHeight(for type: ActionSheetItemCell.Type) -> Double {
        let height = type.appearance().height
        if height > 0 { return height }
        guard let parent = type.superclass() as? ActionSheetItemCell.Type else { return 0 }
        return resolveHeight(for: parent)
    }
}
