//
//  ActionSheetPresenterBase.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This is a base class for action sheet presenters. It's used
 by the built-in presenters and can be used by yours as well.
 */
open class ActionSheetPresenterBase: ActionSheetPresenter {
    
    
    // MARK: - Initialization
    
    public init(
        notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
    }
    
    
    // MARK: - Dependencies
    
    private let notificationCenter: NotificationCenter

    
    // MARK: - Properties
    
    var actionSheet: ActionSheet?
    
    public var events = ActionSheetPresenterEvents()
    
    
    // MARK: - ActionSheetPresenter
    
    open func dismiss(completion: @escaping () -> ()) {}
    
    open func present(_ sheet: ActionSheet, in vc: UIViewController, view: UIView? = nil, item: UIBarButtonItem? = nil, completion: @escaping () -> ()) {
        setupDidEnterBackgroundDetection()
        setupOrientationChangeDetection()
    }
    
    open func refreshActionSheet() {}
    
    
    // MARK: - Notifications
    
    @objc open func handleDidEnterBackground() {
        guard let config = actionSheet?.configuration else { return }
        guard config.isDismissable && config.shouldBeDismissedWhenEnteringBackground else { return }
        dismiss {}
    }
    
    @objc open func handleOrientationChange() {}
    
    func setupDidEnterBackgroundDetection() {
        let action = #selector(handleDidEnterBackground)
        let name = UIApplication.didEnterBackgroundNotification
        notificationCenter.removeObserver(self, name: name, object: nil)
        notificationCenter.addObserver(self, selector: action, name: name, object: nil)
    }
    
    func setupOrientationChangeDetection() {
        let action = #selector(handleOrientationChange)
        let name = UIApplication.willChangeStatusBarOrientationNotification
        notificationCenter.removeObserver(self, name: name, object: nil)
        notificationCenter.addObserver(self, selector: action, name: name, object: nil)
    }
}


// MARK: - Public Extensions

public extension ActionSheetPresenterBase {
    
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: @escaping () -> ()) {
        present(sheet, in: vc, view: view, completion: completion)
    }
    
    func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem, completion: @escaping () -> ()) {
        present(sheet, in: vc, item: item, completion: completion)
    }
}
