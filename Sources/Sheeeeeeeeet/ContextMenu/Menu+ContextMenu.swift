//
//  Menu+ContextMenu.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
public extension Menu {

    /**
     Try to convert the menu to a `UIMenu`.
     
     This operation will only succeed if all menu items that
     have `shouldBeIgnoredByContextMenu` set to `false` also
     have `canBeUsedInContextMenu` set to `true`. If this is
     not true, this operation will fail.
     */
    func toContextMenu(action: @escaping (MenuItem) -> ()) -> Result<UIMenu, ContextMenuConversionError> {
        let items = self.items.filter { !$0.shouldBeIgnoredByContextMenu }
        let actionResults = items.map { $0.toContextMenuAction(action: action) }
        let actions = actionResults.compactMap { try? $0.get() }
        let isError = items.count > actions.count
        if isError { return .failure(ContextMenuConversionError.unsupportedItemTypes) }
        let result = UIMenu(title: title ?? "", children: actions)
        return .success(result)
    }
}

