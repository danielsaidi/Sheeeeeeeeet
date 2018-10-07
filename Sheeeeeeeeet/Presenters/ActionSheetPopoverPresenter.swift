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
 should only be used when a sheet is displayed on an iPad.
 
 Since popovers have an arrow that should use the same color
 as the rest of the popover view, this presenter will remove
 any header view as well as combine items and buttons into a
 single section.
 
 */

import UIKit

open class ActionSheetPopoverPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Initialization
    
    public override init() { }
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Properties
    
    open var events = ActionSheetPresenterEvents()
    open var isDismissableWithTapOnBackground = true
    
    private var actionSheet: ActionSheet?
    private var actionSheetView: UIView?
    private var backgroundView: UIView?
    
    
    // MARK: - ActionSheetPresenter
    
    public func dismiss(completion: @escaping () -> ()) {
        let dismissAction = {
            completion()
            self.actionSheet = nil
        }
        guard let vc = actionSheet?.presentingViewController else { return dismissAction() }
        vc.dismiss(animated: true) { dismissAction() }
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        guard let popover = self.popover(for: sheet, in: vc) else { return }
        popover.sourceView = view
        popover.sourceRect = view?.bounds ?? CGRect()
        popover.delegate = self
        vc.present(sheet, animated: true, completion: nil)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem) {
        guard let popover = self.popover(for: sheet, in: vc) else { return }
        popover.barButtonItem = item
        vc.present(sheet, animated: true, completion: nil)
    }
    
    public func presentationFrame(for sheet: ActionSheet, in view: UIView) -> CGRect? {
        return nil
    }
}

extension ActionSheetPopoverPresenter: UIPopoverPresentationControllerDelegate {
    
    public func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        guard isDismissableWithTapOnBackground else { return false }
        events.didDismissWithBackgroundTap?()
        dismiss {}
        return false
    }
}


// MARK: - Actions

@objc extension ActionSheetPopoverPresenter {
    
    func applicationWillClose() {
        dismiss {}
    }
}


// MARK: - Private Functions

fileprivate extension ActionSheetPopoverPresenter {
    
    func popover(for sheet: ActionSheet, in vc: UIViewController) -> UIPopoverPresentationController? {
        guard sheet.contentHeight > 0 else { return nil }
        setupSheetForPopoverPresentation(sheet)
        sheet.modalPresentationStyle = .popover
        let popover = sheet.popoverPresentationController
        popover?.backgroundColor = sheet.view.backgroundColor
        popover?.delegate = vc as? UIPopoverPresentationControllerDelegate
        return popover
    }
    
    func popoverItems(for sheet: ActionSheet) -> [ActionSheetItem] {
        let items: [ActionSheetItem] = sheet.items + sheet.buttons
        return items.filter { !($0 is ActionSheetCancelButton) }
    }
    
    func setupSheetForPopoverPresentation(_ sheet: ActionSheet) {
        self.actionSheet = sheet
        sheet.headerView = nil
        sheet.items = popoverItems(for: sheet)
        sheet.buttons = []
        sheet.preferredContentSize = sheet.preferredPopoverSize
        sheet.view.backgroundColor = sheet.itemsView.backgroundColor
    }
}
