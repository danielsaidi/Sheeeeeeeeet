//
//  Menu+AlertController.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

//  TODO: Unit test alert controller presentations.

import UIKit

public extension Menu {
    
    /**
     Present the menu as an alert controller.
     
     If the menu can't be represented as an alert controller,
     the operation will fail with an error.
     */
    func presentAsAlertController(
        in vc: UIViewController,
        from view: UIView?,
        action: @escaping Menu.ItemAction) -> AlertControllerConversionError? {
        let result = toAlertController(action: action)
        switch result {
        case .failure(let error): return error
        case .success(let controller):
            controller.popoverPresentationController?.sourceView = view
            controller.popoverPresentationController?.sourceRect = view?.bounds ?? .zero
            vc.present(controller, animated: true)
            return nil
        }
    }
    
    /**
     Present the menu as an alert controller.
     
     If the menu can't be represented as an alert controller,
     the operation will fail with an error.
     */
    func presentAsAlertController(
        in vc: UIViewController,
        from item: UIBarButtonItem,
        action: @escaping Menu.ItemAction) -> AlertControllerConversionError? {
        let result = toAlertController(action: action)
        switch result {
        case .failure(let error): return error
        case .success(let controller):
            controller.popoverPresentationController?.barButtonItem = item
            vc.present(controller, animated: true)
            return nil
        }
    }
    
    /**
     Try to convert the menu to a `UIAlertController`.
     
     This operation will only succeed if all items for which
     `shouldBeIgnoredByAlertController` is `false` also have
     `true` for `canBeUsedInAlertController`. Otherwise, the
     operation will fail.
     */
    func toAlertController(action: @escaping (MenuItem) -> ()) -> Result<UIAlertController, AlertControllerConversionError> {
        let items = self.items.filter { !$0.shouldBeIgnoredByAlertController }
        let actionResults = items.map { $0.toAlertAction(action: action) }
        let actions = actionResults.compactMap { try? $0.get() }
        let isError = items.count > actions.count
        if isError { return .failure(AlertControllerConversionError.unsupportedItemTypes) }
        let controller = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        actions.forEach { controller.addAction($0) }
        return .success(controller)
    }
}
