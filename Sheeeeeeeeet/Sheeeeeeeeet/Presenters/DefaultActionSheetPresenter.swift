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
    
    fileprivate var actionSheetView: UIView?
    
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
        dismissActionSheet()
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: (() -> ())?) {
        if shouldDelegatePresentation {
            iPadPresenter?.present(sheet: sheet, in: vc, from: view, completion: completion)
            return
        }
        addBackgroundView(to: vc.view)
        addActionSheet(sheet, to: vc.view)
    }
}


// MARK: - Actions

@objc extension DefaultActionSheetPresenter {
    
    func dismissActionSheet() {
        removeActionSheetView()
        removeBackgroundView()
    }
}


// MARK: - Private Functions

fileprivate extension DefaultActionSheetPresenter {
    
    func getFrame(for sheet: ActionSheet, in view: UIView) -> CGRect {
        var targetFrame = view.frame
        let inset = sheet.appearance.contentInset
        targetFrame = targetFrame.insetBy(dx: inset, dy: inset)
        targetFrame.size.height = sheet.contentHeight
        targetFrame.origin.y = view.frame.height - sheet.contentHeight
        targetFrame.origin.y -= max(view.safeAreaInsets.bottom, inset)
        return targetFrame
    }
    
    func addActionSheet(_ sheet: ActionSheet, to view: UIView) {
        guard let actionSheetView = sheet.view else { return }
        actionSheetView.frame.size.height = sheet.contentHeight
        actionSheetView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        let frame = getFrame(for: sheet, in: view)
        actionSheetView.frame = frame
        actionSheetView.frame.origin.y += 100
        view.addSubview(actionSheetView)
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1, animations: nil)
        animator.addAnimations { actionSheetView.frame = frame }
        animator.startAnimation()
        self.actionSheetView = actionSheetView
    }
    
    func addBackgroundView(to view: UIView) {
        let backgroundView = UIView(frame: view.frame)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.backgroundColor = backgroundColor
        backgroundView.alpha = 0
        addDismissTap(to: backgroundView)
        view.addSubview(backgroundView)
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1, animations: nil)
        animator.addAnimations { backgroundView.alpha = 1 }
        animator.startAnimation()
        self.backgroundView = backgroundView
    }
    
    func addDismissTap(to view: UIView) {
        view.isUserInteractionEnabled = true
        let action = #selector(dismissActionSheet)
        let tap = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(tap)
    }
    
    func removeActionSheetView() {
        guard let view = actionSheetView else { return }
        var frame = view.frame
        frame.origin.y += frame.height + 100
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1, animations: nil)
        animator.addAnimations { view.frame = frame }
        animator.addCompletion { _ in view.removeFromSuperview() }
        animator.startAnimation()
    }
    
    func removeBackgroundView() {
        guard let view = backgroundView else { return }
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 1, animations: nil)
        animator.addAnimations { view.alpha = 0 }
        animator.addCompletion { _ in view.removeFromSuperview() }
        animator.startAnimation()
    }
}
