//
//  OkButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 An `OkButton` can be used to "submit" or confirm the effect
 of a menu, e.g. in action sheets where the user must tap an
 OK button to perform the menu actio dismiss the action sheet.
 
 The `value` of an ok button is `.ok`.
 */
open class OkButton: MenuButton {
    
    public init(title: String) {
        super.init(title: title, type: .ok)
    }
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }
}
