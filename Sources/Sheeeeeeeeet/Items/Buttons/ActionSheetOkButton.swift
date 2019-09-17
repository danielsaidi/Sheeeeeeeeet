//
//  ActionSheetOkButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 OK buttons have no special behavior, but can be used when a
 user should manually approve the effect of an action sheet.
 
 The value of an OK button is `.ok`.
 */
open class ActionSheetOkButton: ActionSheetButton {
    
    public init(title: String) {
        super.init(title: title, type: .ok)
    }
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetOkButtonCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    }
}


// MARK: - 

open class ActionSheetOkButtonCell: ActionSheetButtonCell {}
