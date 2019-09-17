//
//  ActionSheetDangerButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Danger buttons have no special behavior, but can be used to
 indicate that the effect of the action sheet is destructive.
 They should be styled as "dangerous" (e.g. red text).
 
 The value of a danger button is `.ok`.
 */
open class ActionSheetDangerButton: ActionSheetOkButton {
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetDangerButtonCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    }
}


// MARK: -

open class ActionSheetDangerButtonCell: ActionSheetButtonCell {}
