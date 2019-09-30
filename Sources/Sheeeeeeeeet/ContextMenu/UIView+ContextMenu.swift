//
//  UIView+ContextMenu.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension UIView {

    /**
     Apply a `Menu` as context menu to the view.
     
     The delegate that is returned must be retained. If it's
     not, the context menu will stop working.
     
     If the menu can't be represented as a context menu, the
     app will crash when it tries to create the context menu.
     */
    func addContextMenu(_ menu: Menu, action: @escaping (MenuItem) -> ()) -> ContextMenuDelegate {
        menu.addAsContextMenu(to: self, action: action)
    }
}

@available(iOS 13.0, *)
public extension ContextMenuDelegateRetainer where Self: UIView {
    
    /**
     Apply a `Menu` as context menu to the trigger view, and
     retain the returned delegate in the trigger view.
     
     If the menu can't be represented as a context menu, the
     app will crash when it tries to create the context menu.
     */
    func addRetainedContextMenu(_ menu: Menu, action: @escaping (MenuItem) -> ()) {
        menu.addAsRetainedContextMenu(to: self, action: action)
    }
}
