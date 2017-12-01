//
//  ActionSheetPresenterBase.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class is used as a base class by Sheeeeeeeeet's action
 sheet presenters. You can use it if you want to create your
 own presenter, but you don't have to.
 
 */

import UIKit

open class ActionSheetPresenterBase: ActionSheetPresenter {

    
    // MARK: - Properties
    
    open var actionSheetView: UIView?
    open var backgroundView: UIView?
    
    
    // MARK: - ActionSheetPresenter
    
    open func dismiss(sheet: ActionSheet) {
        dismissActionSheet()
    }
    
    open func pop(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        addActionSheet(sheet, to: vc.view, fromBottom: false)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        addActionSheet(sheet, to: vc.view, fromBottom: true)
    }
    
    
    // MARK: - Protected Functions
    
    open func addActionSheet(_ sheet: ActionSheet, to view: UIView, fromBottom: Bool = true) {
        addBackgroundView(to: view)
        addActionSheetView(from: sheet, to: view)
        presentBackgroundView(fromBottom: fromBottom)
        presentActionSheet(sheet, in: view, fromBottom: fromBottom)
    }
    
    open func addActionSheetView(from sheet: ActionSheet, to view: UIView) {
        guard let actionSheetView = sheet.view else { return }
        actionSheetView.frame.size.height = sheet.contentHeight
        view.addSubview(actionSheetView)
        self.actionSheetView = actionSheetView
    }
    
    open func addBackgroundView(to view: UIView) {
        let backgroundView = UIView(frame: view.frame)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addDismissTap(to: backgroundView)
        view.addSubview(backgroundView)
        self.backgroundView = backgroundView
    }
    
    open func addDismissTap(to view: UIView) {
        view.isUserInteractionEnabled = true
        let action = #selector(dismissActionSheet)
        let tap = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(tap)
    }
    
    open func animate(_ animation: @escaping () -> ()) {
        animate(animation, completion: nil)
    }
    
    open func animate(_ animation: @escaping () -> (), completion: (() -> ())?) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseOut],
            animations: animation) { _ in completion?() }
    }
    
    open func presentActionSheet(_ sheet: ActionSheet, in view: UIView, fromBottom: Bool) {
        guard let sheetView = actionSheetView else { return }
        let frame = getBottomFrame(for: sheet, in: view)
        sheetView.frame = frame
        if fromBottom {
            sheetView.frame.origin.y += 100
            animate { sheetView.frame = frame }
        } else {
            sheetView.center = view.center
        }
        sheetView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    }
    
    open func presentBackgroundView(fromBottom: Bool) {
        guard let view = backgroundView else { return }
        view.alpha = 0
        animate { view.alpha = 1 }
    }
    
    open func removeActionSheetView() {
        guard let view = actionSheetView else { return }
        var frame = view.frame
        frame.origin.y += frame.height + 100
        animate({ view.frame = frame }) { view.removeFromSuperview() }
    }
    
    open func removeBackgroundView() {
        guard let view = backgroundView else { return }
        animate({ view.alpha = 0 }) { view.removeFromSuperview() }
    }
}


// MARK: - Actions

@objc public extension ActionSheetPresenterBase {
    
    public func dismissActionSheet() {
        removeActionSheetView()
        removeBackgroundView()
    }
}
