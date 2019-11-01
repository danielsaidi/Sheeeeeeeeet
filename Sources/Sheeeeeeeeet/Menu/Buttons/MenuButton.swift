//
//  MenuButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class is a base class for all buttons that can be used
 within a menu. It corresponds to the button items that will
 be shown bottommost in an action sheet.
 
 Some contexts may remove some of the buttons in a menu. For
 instance, cancel buttons make no sense in a popover or in a
 native iOS 13 context menu, since they are dismissed when a
 user taps outside of the menu.
 */
open class MenuButton: MenuItem {
    
    public init(title: String, type: ButtonType) {
        self.type = type
        super.init(title: title, value: type)
    }
    
    public enum ButtonType: Equatable {
        case ok, cancel, other
    }
    
    public let type: ButtonType
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }
}
