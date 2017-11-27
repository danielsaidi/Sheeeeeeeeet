//
//  DefaultActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as regular action
 sheets, just as regular UIAlertControllers are displayed on
 the iPhone.
 
 Whenever used on an iPad, this presenter will fallback to a
 PopoverActionSheetPresenter. You can change this default by
 injecting another iPad presenter in the initializer, or set
 the iPad presenter to nil to use the default presenter.
 
 */

import UIKit

open class DefaultActionSheetPresenter: ActionSheetPresenter {
    
    
    // MARK: - Initialization
    
    public convenience init() {
        let color = UIColor.black.withAlphaComponent(0.3)
        self.init(backgroundColor: color)
    }
    
    public convenience init(backgroundColor: UIColor) {
        let iPadPresenter = PopoverActionSheetPresenter()
        self.init(backgroundColor: backgroundColor, iPadPresenter: iPadPresenter)
    }
    
    public init(backgroundColor: UIColor, iPadPresenter: ActionSheetPresenter?) {
        self.backgroundColor = backgroundColor
        self.iPadPresenter = iPadPresenter
    }
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Properties
    
    fileprivate var backgroundColor: UIColor?
    
    fileprivate var backgroundView: UIView?
    
    fileprivate var iPadPresenter: ActionSheetPresenter?
    
    fileprivate var shouldDelegatePresentation: Bool {
        let ipad = UIDevice.current.userInterfaceIdiom == .pad
        return ipad && iPadPresenter != nil
    }
    
    
    // MARK: - ActionSheetPresenter
    
    public func dismiss(sheet: ActionSheet, completion: (() -> ())?) {
        if shouldDelegatePresentation {
            iPadPresenter?.dismiss(sheet: sheet, completion: completion)
            return
        }
        
        removeBackgroundView()
        
        //backgroundView?.remove
//        sheet.presentingViewController?.dismiss(animated: true, completion: completion)
//        sheet.view.backgroundColor = actionSheetBackgroundColor
//        sheet.headerView = actionSheetHeaderView
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: (() -> ())?) {
        if shouldDelegatePresentation {
            iPadPresenter?.present(sheet: sheet, in: vc, from: view, completion: completion)
            return
        }
        
        addBackgroundView(to: vc.view)
//        adjustSheetForPopoverPresentation(sheet)
//        sheet.preferredContentSize = sheet.preferredPopoverSize
//        let popover = getPopoverPresentationController(for: sheet, in: vc)
//        setup(popover: popover, for: view)
//        vc.present(sheet, animated: true, completion: completion)
    }
}


// MARK: - Actions

@objc extension DefaultActionSheetPresenter {
    
    func dismissViewTapped() {
        
    }
}


// MARK: - Private Functions

fileprivate extension DefaultActionSheetPresenter {
    
    func addBackgroundView(to view: UIView) {
        let backgroundView = UIView(frame: view.frame)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.backgroundColor = backgroundColor
        backgroundView.alpha = 0
        view.addSubview(backgroundView)
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1, animations: nil)
        animator.addAnimations { backgroundView.alpha = 1 }
        animator.startAnimation()
        self.backgroundView = backgroundView
    }
    
//    func addDismissTap(to view: UIView) {
//        view.isUserInteractionEnabled = true
//        let tap = UITapGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
//    }
    
    func removeBackgroundView() {
        backgroundView?.alpha = 0
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0, animations: nil)
        animator.addAnimations { self.backgroundView?.alpha = 0 }
        animator.addCompletion { _ in self.backgroundView?.removeFromSuperview() }
        animator.startAnimation()
    }
    
    
//    func adjustSheetForPopoverPresentation(_ sheet: ActionSheet) {
//        actionSheetBackgroundColor = sheet.view.backgroundColor
//        sheet.view.backgroundColor = sheet.tableView.backgroundColor
//        actionSheetHeaderView = sheet.headerView
//        sheet.headerView = nil
//    }
//
//    func getPopoverPresentationController(for sheet: ActionSheet, in vc: UIViewController) -> UIPopoverPresentationController? {
//        sheet.modalPresentationStyle = .popover
//        let popover = sheet.popoverPresentationController
//        popover?.backgroundColor = sheet.view.backgroundColor
//        popover?.delegate = vc as? UIPopoverPresentationControllerDelegate
//        return popover
//    }
//
//    func setup(popover: UIPopoverPresentationController?, for view: UIView?) {
//        guard let view = view else { return }
//        popover?.sourceView = view
//        let bounds = view.bounds
//        var center = bounds.origin
//        center.x += bounds.size.width / 2
//        center.y += bounds.size.height / 2
//        popover?.sourceRect = CGRect(x: center.x, y: center.y, width: 1, height: 1)
//    }
}

