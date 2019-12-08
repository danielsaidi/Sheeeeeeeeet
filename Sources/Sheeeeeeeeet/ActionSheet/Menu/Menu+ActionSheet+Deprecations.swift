//
//  Menu+ActionSheet+Deprecations.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension Menu {
    
    /**
     Present the menu as a custom action sheet from a custom
     view, using the default or a custom presenter.
     */
    @available(*, deprecated, message: "Use `toActionSheet` and then present it instead.")
    @discardableResult
    func presentAsActionSheet(
        in vc: UIViewController,
        from view: UIView?,
        using presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping ActionSheet.SelectAction) -> ActionSheet {
        let sheet = ActionSheet(menu: self, presenter: presenter, action: action)
        sheet.present(in: vc, from: view)
        return sheet
    }
    
    /**
     Present the menu as a custom action sheet from a button
     in any navigation or toolbar.
     */
    @available(*, deprecated, message: "Use `toActionSheet` and then present it instead.")
    @discardableResult
    func presentAsActionSheet(
        in vc: UIViewController,
        from view: UIBarButtonItem,
        using presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping ActionSheet.SelectAction) -> ActionSheet {
        let sheet = ActionSheet(menu: self, presenter: presenter, action: action)
        sheet.present(in: vc, from: view)
        return sheet
    }
}
