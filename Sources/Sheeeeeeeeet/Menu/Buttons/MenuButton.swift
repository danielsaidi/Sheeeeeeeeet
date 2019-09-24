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
 
 A menu button should be used to submit, confirm, cancel etc.
 As such, it always has `.dismiss` as tap behavior.
 
 Some contexts may remove some of the buttons within a menu.
 For instance, a cancel button makes no sense in popovers or
 iOS 13 context menus, since they are dismissed when tapping
 outside of the menu.
 */
open class MenuButton: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, type: ButtonType) {
        self.type = type
        super.init(title: title, value: type)
    }
    
    
    // MARK: - Types
    
    public enum ButtonType: Equatable {
        case ok, cancel, other
    }
    
    public let type: ButtonType
}
