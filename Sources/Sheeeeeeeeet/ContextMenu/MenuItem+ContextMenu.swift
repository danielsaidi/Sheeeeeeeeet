//
//  MenuItem+ContextMenu.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension MenuItem {
    
    /**
     Whether or not the item can be mapped to `UIAction` and
     still serve its purpose.
     */
    var canBeUsedInContextMenu: Bool {
        if self is CustomItem { return false }
        if self is CollectionItem { return false }
        if self is MenuButton { return false }
        if self is MenuTitle { return false }
        if self is MultiSelectItem { return false }
        if self is MultiSelectToggleItem { return false }
        if self is SingleSelectItem { return false }
        return true
    }
    
    /**
     Whether or not the item should be ignored when creating
     a context menu from a `Menu`.
     
     This will return true for items that can't be mapped to
     `UIAction` but also do not provide any functionality to
     context menu and thus can be safely ignored by the menu.
     */
    var shouldBeIgnoredByContextMenu: Bool {
        if self is CancelButton { return true }
        if self is MenuTitle { return true }
        return false
    }
    
    /**
     Try to convert the item to a `UIAction`. If the item is
     not mappable to `UIAction` while still serving its main
     purpose, the operation will fail.
     */
    func toContextMenuAction(action: @escaping (MenuItem) -> ()) -> Result<UIAction, ContextMenuConversionError> {
        guard canBeUsedInContextMenu else { return .failure(.unsupportedItemType) }
        let action = UIAction(title: title, image: image) { [weak self] _ in
            guard let self = self else { return }
            action(self)
        }
        return .success(action)
    }
}
