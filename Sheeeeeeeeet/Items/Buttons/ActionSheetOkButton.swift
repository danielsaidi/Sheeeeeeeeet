//
//  ActionSheetOkButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 OK buttons have no special behavior, but can be used when a
 user should apply action sheet changes by tapping a button.
 
 The value of an OK button is `.ok`.
 
 */

import UIKit

open class ActionSheetOkButton: ActionSheetButton {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(title: title, type: .ok)
    }
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetOkButtonCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    }
}


// MARK: - 

open class ActionSheetOkButtonCell: ActionSheetButtonCell {}
