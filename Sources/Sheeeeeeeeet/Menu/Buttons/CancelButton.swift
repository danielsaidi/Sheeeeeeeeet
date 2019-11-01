//
//  CancelButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A `CancelButton` can be used to cancel the effect of a menu
 or to close it without action.
 
 The `value` of a cancel button is `.cancel`.
 */
open class CancelButton: MenuButton {
    
    public init(title: String) {
        super.init(title: title, type: .cancel)
    }
    
    override var canBeUsedInAlertController: Bool { true }
    override var canBeUsedInContextMenu: Bool { false }
    override var shouldBeIgnoredByContextMenu: Bool { return true }
}
