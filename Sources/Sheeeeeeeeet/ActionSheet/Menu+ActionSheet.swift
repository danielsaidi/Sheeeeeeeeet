//
//  Menu+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension Menu {
    
    @discardableResult
    func presentAsCustomActionSheet(
        in vc: UIViewController,
        from view: UIView?,
        using presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping ActionSheet.SelectAction) -> ActionSheet {
        let sheet = ActionSheet(menu: self, presenter: presenter, action: action)
        sheet.present(in: vc, from: view)
        return sheet
    }
    
    @discardableResult
    func presentAsCustomActionSheet(
        in vc: UIViewController,
        from view: UIBarButtonItem,
        using presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping ActionSheet.SelectAction) -> ActionSheet {
        let sheet = ActionSheet(menu: self, presenter: presenter, action: action)
        sheet.present(in: vc, from: view)
        return sheet
    }
}
