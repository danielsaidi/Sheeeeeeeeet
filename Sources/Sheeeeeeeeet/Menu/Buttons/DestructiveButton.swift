//
//  DestructiveButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A `DestructiveButton` is just an OK button that can be used
 to indicate that tapping it has a destructive effect.
 
 The `value` of a destructive button is `.ok`.
 */
open class DestructiveButton: OkButton {
    
    override var canBeUsedInAlertController: Bool { true }
    override var canBeUsedInContextMenu: Bool { false }
}
