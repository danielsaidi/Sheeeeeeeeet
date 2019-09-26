//
//  MenuItem+AlertController.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension MenuItem {
    
    fileprivate typealias CompletionHandler = ((UIAlertAction) -> Void)
    
    /**
     Try to convert the item to a `UIAction`. If the item is
     not mappable to `UIAction` while still serving its main
     purpose, the operation will fail.
     */
    func toAlertAction(action: @escaping Menu.ItemAction) -> Result<UIAlertAction, AlertControllerConversionError> {
        guard canBeUsedInAlertController else { return .failure(.unsupportedItemType) }
        let handler: CompletionHandler = { _ in action(self) }
        if let item = toDestructiveButton(handler: handler) { return .success(item) }
        if let item = toCancelButton(handler: handler) { return .success(item) }
        return .success(toStandardItem(handler: handler))
    }
}

private extension MenuItem {
    
    func toCancelButton(handler: @escaping CompletionHandler) -> UIAlertAction? {
        guard self is CancelButton else { return nil }
        return UIAlertAction(title: title, style: .cancel, handler: handler)
    }
    
    func toDestructiveButton(handler: @escaping CompletionHandler) -> UIAlertAction? {
        guard self is DestructiveButton else { return nil }
        return UIAlertAction(title: title, style: .destructive, handler: handler)
    }
    
    func toStandardItem(handler: @escaping CompletionHandler) -> UIAlertAction {
        UIAlertAction(title: title, style: .default, handler: handler)
    }
}
