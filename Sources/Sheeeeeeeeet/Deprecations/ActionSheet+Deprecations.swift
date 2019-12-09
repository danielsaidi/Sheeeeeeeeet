//
//  ActionSheet+Deprecated.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheet {
    
    @available(*, deprecated, renamed: "HeaderConfiguration")
    typealias HeaderViewConfiguration = HeaderConfiguration
    
    @available(*, deprecated, renamed: "headerConfiguration")
    var headerViewConfiguration: HeaderViewConfiguration {
        get { headerConfiguration }
        set { headerConfiguration = newValue }
    }
}

public extension ActionSheetAppearance {
    
    @available(*, deprecated, renamed: "destructiveButton")
    var dangerButton: ActionSheetDestructiveButtonCell { destructiveButton }
}

public extension ActionSheetPopoverPresenter {
    
    @available(*, deprecated, renamed: "isDismissableWithOrientationChange")
    var isListeningToOrientationChanges: Bool {
        get { isDismissableWithOrientationChange }
        set { isDismissableWithOrientationChange = newValue }
    }
}

public extension Menu {
    
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

public typealias ActionSheetDangerButtonCell = ActionSheetDestructiveButtonCell
