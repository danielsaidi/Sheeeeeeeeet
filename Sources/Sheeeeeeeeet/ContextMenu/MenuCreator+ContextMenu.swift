//
//  MenuCreator+ContextMenu.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension MenuCreator {
    
    /**
    Apply the created menu as context menu to a view.
    
    The delegate that is returned must be retained. If it's
    not, the context menu will stop working.
    
    If the menu can't be represented as a context menu, the
    app will crash when it tries to create the context menu.
    */
    func addAsContextMenu(
        to view: UIView,
        configuration: ContextMenu.Configuration = .standard,
        previewProvider: UIContextMenuContentPreviewProvider? = nil,
        action: @escaping (MenuItem) -> ()) -> ContextMenuDelegate {
        view.isUserInteractionEnabled = true
        let delegate = ContextMenuDelegate(
            menuCreator: self,
            configuration: configuration,
            previewProvider: previewProvider,
            action: action)
        let interaction = UIContextMenuInteraction(delegate: delegate)
        view.addInteraction(interaction)
        return delegate
    }
    
    /**
     Apply the created menu as context menu to a view.
     
     The delegate that is returned must be retained. If it's
     not, the context menu will stop working.
     
     If the menu can't be represented as a context menu, the
     app will crash when it tries to create the context menu.
    */
    func addAsRetainedContextMenu(
        to view: UIView & ContextMenuDelegateRetainer,
        configuration: ContextMenu.Configuration = .standard,
        previewProvider: UIContextMenuContentPreviewProvider? = nil,
        action: @escaping (MenuItem) -> ()) {
        let delegate = addAsContextMenu(
            to: view,
            configuration: configuration,
            previewProvider: previewProvider,
            action: action)
        view.contextMenuDelegate = delegate
    }

    /**
     Try to convert the created menu to a `UIMenu`.
     
     This operation will only succeed if all items for which
     `shouldBeIgnoredByContextMenu` is `false` also have the
     `canBeUsedInContextMenu` property set to `true`. If not,
     the operation will fail.
     */
    func toContextMenu(action: @escaping (MenuItem) -> ()) -> Result<UIMenu, ContextMenuConversionError> {
        let menu = createMenu()
        let items = menu.items.filter { !$0.shouldBeIgnoredByContextMenu }
        let actionResults = items.map { $0.toContextMenuAction(action: action) }
        let actions = actionResults.compactMap { try? $0.get() }
        let hasUnsupportedTypes = items.count > actions.count
        if hasUnsupportedTypes { return .failure(.unsupportedItemTypes) }
        let result = UIMenu(title: menu.title ?? "", children: actions)
        return .success(result)
    }
}
