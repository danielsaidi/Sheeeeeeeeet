//
//  CancelButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 A cancel button can be used to cancel the effect of a menu,
 
 The `value` of the button is `.cancel`.
 */
open class CancelButton: MenuButton {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(title: title, type: .cancel)
    }
    
    
    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetCancelButton(title: title)
    }
}
