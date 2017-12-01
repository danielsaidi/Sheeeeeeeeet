//
//  ActionSheetDefaultPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as regular action
 sheets, i.e. as UIAlertControllers are displayed on a phone.
 It will, however, fallback to a ActionSheetPopoverPresenter
 whenever used on an iPad.
 
 */

import UIKit

open class ActionSheetDefaultPresenter: ActionSheetPresenterBase {
    
    
    // MARK: - Initialization
    
    public override init() {
        iPadPresenter = ActionSheetPopoverPresenter()
    }
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Presenters
    
    open var iPadPresenter: ActionSheetPresenter?
    
    
    // MARK: - Properties
    
    public var backgroundColor = UIColor.black.withAlphaComponent(0.4)
    
    fileprivate var shouldUseiPadPresenter: Bool {
        let ipad = UIDevice.current.userInterfaceIdiom == .pad
        return ipad && iPadPresenter != nil
    }
    
    
    // MARK: - ActionSheetPresenter
    
    open override func dismiss(sheet: ActionSheet) {
        shouldUseiPadPresenter ?
            iPadPresenter?.dismiss(sheet: sheet) :
            super.dismiss(sheet: sheet)
    }
    
    open override func pop(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        shouldUseiPadPresenter ?
            iPadPresenter?.pop(sheet: sheet, in: vc, from: view) :
            super.pop(sheet: sheet, in: vc, from: view)
    }
    
    open override func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        shouldUseiPadPresenter ?
            iPadPresenter?.present(sheet: sheet, in: vc, from: view) :
            super.present(sheet: sheet, in: vc, from: view)
    }
    
    
    // MARK: - Protected Functions
    
    open override func addBackgroundView(to view: UIView) {
        super.addBackgroundView(to: view)
        backgroundView?.backgroundColor = backgroundColor
    }
    
    open override func presentBackgroundView(fromBottom: Bool) {
        super.presentBackgroundView(fromBottom: fromBottom)
        guard let view = backgroundView else { return }
        view.alpha = 0
        animate { view.alpha = 1 }
    }
}
