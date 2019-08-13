//
//  ActionSheetButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class is a base class for all action sheet buttons.
 */
open class ActionSheetButton: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, value: Any?) {
        super.init(title: title, value: value)
    }
    
    public init(title: String, type: ButtonType) {
        super.init(title: title, value: type)
    }
    
    
    // MARK: - Values
    
    public enum ButtonType {
        case ok, cancel, other
    }
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetButtonCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    }
}


// MARK: -

open class ActionSheetButtonCell: ActionSheetItemCell {
    
    open override func refresh() {
        super.refresh()
        textLabel?.textAlignment = .center
    }
}


// MARK: - Button Extensions

public extension ActionSheetItem {
    
    var isOkButton: Bool {
        return value as? ActionSheetButton.ButtonType == .ok
    }
    
    var isCancelButton: Bool {
        return value as? ActionSheetButton.ButtonType == .cancel
    }
}
