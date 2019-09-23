//
//  OkButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 An ok button can be used to "submit" or confirm the effects
 of a menu, e.g. in action sheets where the user must tap an
 OK button to dismiss the action sheet.
 
 The `value` of an ok button is `.ok`.
 */
open class OkButton: MenuButton {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(title: title, type: .ok)
    }
    
    
    // MARK: - ActionSheet
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetOkButtonCell(style: .default)
    }
    
    open override var cellType: ActionSheetItemCell.Type {
        ActionSheetOkButtonCell.self
    }
}
