//
//  ActionSheetPopoverPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as popovers, just
 as regular UIAlertControllers are displayed on the iPad. It
 should only be used when an action sheet is displayed on an
 iPad device.
 
 The default action sheet presenter will fallback to using a
 popover presenter whenever presentation occurs on an iPad.
 
 Since popovers have an arrow that should use the same color
 as the rest of the popover view, this presenter will remove
 any header view from the sheet and combine items and buttons.
 
 */

import UIKit

open class ActionSheetPopoverPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Initialization
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Properties
    
    public fileprivate(set) var actionSheetView: UIView?
    public fileprivate(set) var backgroundView: UIView?
    
    
    // MARK: - ActionSheetPresenter
    
    public func dismiss(sheet: ActionSheet, completion: @escaping () -> ()) {
        sheet.presentingViewController?.dismiss(animated: true, completion: completion)
    }
    
    open func pop(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        present(sheet: sheet, in: vc, from: view)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        guard sheet.contentHeight > 0 else { return }
        adjustSheetForPopoverPresentation(sheet)
        sheet.preferredContentSize = sheet.preferredPopoverSize
        let popover = popoverPresentationController(for: sheet, in: vc)
        popover?.sourceView = view
        popover?.sourceRect = view?.bounds ?? CGRect()
        vc.present(sheet, animated: true, completion: nil)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem) {
        guard sheet.contentHeight > 0 else { return }
        adjustSheetForPopoverPresentation(sheet)
        sheet.preferredContentSize = sheet.preferredPopoverSize
        let popover = popoverPresentationController(for: sheet, in: vc)
        popover?.barButtonItem = item
        vc.present(sheet, animated: true, completion: nil)
    }
}


// MARK: - Private Functions

fileprivate extension ActionSheetPopoverPresenter {
    
    func adjustSheetForPopoverPresentation(_ sheet: ActionSheet) {
        sheet.items = sheet.items + sheet.buttons
        sheet.buttons = []
        sheet.headerView = nil
        sheet.view.backgroundColor = sheet.itemsView.backgroundColor
    }
    
    func popoverPresentationController(for sheet: ActionSheet, in vc: UIViewController) -> UIPopoverPresentationController? {
        sheet.modalPresentationStyle = .popover
        let popover = sheet.popoverPresentationController
        popover?.backgroundColor = sheet.view.backgroundColor
        popover?.delegate = vc as? UIPopoverPresentationControllerDelegate
        return popover
    }
}
