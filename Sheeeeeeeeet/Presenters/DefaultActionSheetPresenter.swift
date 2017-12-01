//
//  DefaultActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as regular action
 sheets, i.e. as UIAlertControllers are displayed on a phone.
 It will, however, fallback to a PopoverActionSheetPresenter
 whenever used on an iPad.
 
 If a presentation follows a peek, this presenter will use a
 PopActionSheetPresenter to handle the presentation instead.
 
 */

import UIKit

open class DefaultActionSheetPresenter: ActionSheetPresenter {
    
    
    // MARK: - Initialization
    
    public init() {
        iPadPresenter = PopoverActionSheetPresenter()
    }
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Presenters
    
    open var iPadPresenter: ActionSheetPresenter?
    
    
    // MARK: - Properties
    
    public var backgroundColor = UIColor.black.withAlphaComponent(0.4)
    
    public fileprivate(set) var actionSheetView: UIView?
    public fileprivate(set) var backgroundView: UIView?
    
    fileprivate var shouldUseiPadPresenter: Bool {
        let ipad = UIDevice.current.userInterfaceIdiom == .pad
        return ipad && iPadPresenter != nil
    }
    
    
    // MARK: - ActionSheetPresenter
    
    open func dismiss(sheet: ActionSheet) {
        shouldUseiPadPresenter ?
            iPadPresenter?.dismiss(sheet: sheet) :
            dismissActionSheet()
    }
    
    open func pop(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        shouldUseiPadPresenter ?
            iPadPresenter?.pop(sheet: sheet, in: vc, from: view) :
            addActionSheet(sheet, to: vc.view, fromBottom: false)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        shouldUseiPadPresenter ?
            iPadPresenter?.present(sheet: sheet, in: vc, from: view) :
            addActionSheet(sheet, to: vc.view, fromBottom: true)
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
    
    func addActionSheet(_ sheet: ActionSheet, to view: UIView, fromBottom: Bool = true) {
        addBackgroundView(to: view)
        addActionSheetView(from: sheet, to: view)
        presentBackgroundView(fromBottom: fromBottom)
        presentActionSheet(sheet, in: view, fromBottom: fromBottom)
    }
    
    func addActionSheetView(from sheet: ActionSheet, to view: UIView) {
        guard let actionSheetView = sheet.view else { return }
        actionSheetView.frame.size.height = sheet.contentHeight
        view.addSubview(actionSheetView)
        self.actionSheetView = actionSheetView
    }
    
    func addBackgroundView(to view: UIView) {
        let backgroundView = UIView(frame: view.frame)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.backgroundColor = backgroundColor
        addDismissTap(to: backgroundView)
        view.addSubview(backgroundView)
        self.backgroundView = backgroundView
    }
    
    func addDismissTap(to view: UIView) {
        view.isUserInteractionEnabled = true
        let action = #selector(dismissActionSheet)
        let tap = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(tap)
    }
    
    func animate(_ animation: @escaping () -> ()) {
        animate(animation, completion: nil)
    }
    
    func animate(_ animation: @escaping () -> (), completion: (() -> ())?) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseOut],
            animations: animation) { _ in completion?() }
    }
    
    func presentActionSheet(_ sheet: ActionSheet, in view: UIView, fromBottom: Bool) {
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
    
    func presentBackgroundView(fromBottom: Bool) {
        guard let view = backgroundView else { return }
        view.alpha = 0
        animate { view.alpha = 1 }
    }
    
    func removeActionSheetView() {
        guard let view = actionSheetView else { return }
        var frame = view.frame
        frame.origin.y += frame.height + 100
        animate({ view.frame = frame }) { view.removeFromSuperview() }
    }
    
    func removeBackgroundView() {
        guard let view = backgroundView else { return }
        animate({ view.alpha = 0 }) { view.removeFromSuperview() }
    }
}
