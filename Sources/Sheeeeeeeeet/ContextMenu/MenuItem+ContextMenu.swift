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
     Try to convert the item to a `UIAction`. If the item is
     not mappable to `UIAction` while still serving its main
     purpose, the operation will fail.
     */
    func toContextMenuAction(action: @escaping (MenuItem) -> ()) -> Result<UIAction, ContextMenuConversionError> {
        guard canBeUsedInContextMenu else { return .failure(.unsupportedItemType) }
        let action = UIAction(title: title, image: image, attributes: attributes) { [weak self] _ in
            guard let self = self else { return }
            action(self)
        }
        return .success(action)
    }
}

@available(iOS 13.0, *)
private extension MenuItem {
    
    var attributes: UIMenuElement.Attributes {
        if !isEnabled { return .disabled }
        if isDestructive { return .destructive }
        return []
    }
    
    var isDestructive: Bool {
        self is DestructiveItem || self is DestructiveButton
    }
}
