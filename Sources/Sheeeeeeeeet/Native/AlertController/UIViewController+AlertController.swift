//
//  UIViewController+AlertController.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

//  TODO: Unit test alert controller presentations.

import UIKit

public extension UIViewController {

    /**
     Present a `Menu` as an alert controller.
     
     If the menu can't be represented as an alert controller,
     the operation will fail with an error.
     */
    func presentAlertController(
        menu: Menu,
        from view: UIView?,
        action: @escaping Menu.ItemAction) -> AlertControllerConversionError? {
        menu.presentAsAlertController(in: self, from: view, action: action)
    }
    
    /**
     Present a `Menu` as an alert controller.
     
     If the menu can't be represented as an alert controller,
     the operation will fail with an error.
     */
    func presentAlertController(
        menu: Menu,
        from item: UIBarButtonItem,
        action: @escaping Menu.ItemAction) -> AlertControllerConversionError? {
        menu.presentAsAlertController(in: self, from: view, action: action)
    }
}
