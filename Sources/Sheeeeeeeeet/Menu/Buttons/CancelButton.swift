//
//  CancelButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A cancel button can be used to cancel the effects of a menu,
 or to close it without action.
 
 The `value` of a cancel button is `.cancel`.
 */
open class CancelButton: MenuButton {
    
    public init(title: String) {
        super.init(title: title, type: .cancel)
    }
    
    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetCancelButtonCell(style: .default)
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetCancelButtonCell.self
    }
}
