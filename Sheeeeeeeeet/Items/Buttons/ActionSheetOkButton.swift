//
//  ActionSheetOkButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 OK buttons have no special behavior, but can be used when a
 user should apply action sheet changes by tapping an button.
 
 The value of an OK button is `ButtonType.ok`.
 
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
    
    
    // MARK: - Deprecated
    
    @available(*, deprecated, message: "applyAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = customAppearance ?? ActionSheetOkButtonAppearance(copy: appearance.okButton)
    }
}


// MARK: - 

open class ActionSheetOkButtonCell: ActionSheetButtonCell {}
