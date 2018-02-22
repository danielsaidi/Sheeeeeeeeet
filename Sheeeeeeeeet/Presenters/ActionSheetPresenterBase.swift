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
    
    open func dismiss(completion: @escaping () -> ()) {
        dismissActionSheet()
        completion()
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        present(sheet: sheet, in: vc)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem) {
        present(sheet: sheet, in: vc)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController) {
        addBackgroundView(to: vc.view)
        addActionSheetView(from: sheet, to: vc.view)
        presentBackgroundView()
        presentActionSheet(sheet, in: vc.view)
    }
    
    
    // MARK: - Protected Functions
    
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
    
    open func presentActionSheet(_ sheet: ActionSheet, in view: UIView) {
        guard let sheetView = actionSheetView else { return }
        sheetView.frame = presentationTransitionStartFrame(for: sheet, in: view)
        animate { sheetView.frame = self.presentationFrame(for: sheet, in: view) ?? .zero }
        sheetView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    }
    
    open func presentationFrame(for sheet: ActionSheet, in view: UIView) -> CGRect? {
        return sheet.bottomPresentationFrame
    }
    
    open func presentationTransitionStartFrame(for sheet: ActionSheet, in view: UIView) -> CGRect {
        var frame = presentationFrame(for: sheet, in: view) ?? .zero
        frame.origin.y += 100
        return frame
    }
    
    open func presentBackgroundView() {}
    
    open func removeActionSheetView() {
        guard let view = actionSheetView else { return }
        var frame = view.frame
        frame.origin.y += frame.height + 100
        let animation = { view.frame = frame }
        animate(animation) { view.removeFromSuperview() }
    }
    
    open func removeBackgroundView() {
        guard let view = backgroundView else { return }
        let animation = { view.alpha = 0 }
        animate(animation) { view.removeFromSuperview() }
    }
}


// MARK: - Actions

@objc public extension ActionSheetPresenterBase {
    
    public func dismissActionSheet() {
        removeActionSheetView()
        removeBackgroundView()
    }
}
