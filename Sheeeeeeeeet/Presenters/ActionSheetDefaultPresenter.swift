//
//  ActionSheetDefaultPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as regular action
 sheets, which means that it presents sheets from the bottom
 on iPhones and in a popover on iPads.
 
 To customize how action sheets are presented on iPads, just
 set the `iPadPresenter` property to a custom presenter. The
 `ActionSheetPopoverPresenter` class is used by default.
 
 */

import UIKit

open class ActionSheetDefaultPresenter: ActionSheetPresenterBase {
    
    
    // MARK: - Initialization
    
    public override init() {
        iPadPresenter = ActionSheetPopoverPresenter()
    }
    
    public init(iPadPresenter: ActionSheetPresenter?) {
        self.iPadPresenter = iPadPresenter
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
    
    open override func dismiss(completion: @escaping () -> ()) {
        shouldUseiPadPresenter ?
            iPadPresenter?.dismiss(completion: completion) :
            super.dismiss(completion: completion)
    }
    
    open override func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        shouldUseiPadPresenter ?
            iPadPresenter?.present(sheet: sheet, in: vc, from: view) :
            super.present(sheet: sheet, in: vc, from: view)
    }
    
    open override func present(sheet: ActionSheet, in vc: UIViewController, from barButtonItem: UIBarButtonItem) {
        shouldUseiPadPresenter ?
            iPadPresenter?.present(sheet: sheet, in: vc, from: barButtonItem) :
            super.present(sheet: sheet, in: vc, from: barButtonItem)
    }
    
    
    // MARK: - Protected Functions
    
    open override func addBackgroundView(to view: UIView) {
        super.addBackgroundView(to: view)
        backgroundView?.backgroundColor = backgroundColor
    }
    
    open override func presentBackgroundView() {
        super.presentBackgroundView()
        guard let view = backgroundView else { return }
        view.alpha = 0
        animate { view.alpha = 1 }
    }
}
