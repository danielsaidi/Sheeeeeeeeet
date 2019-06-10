//
//  ActionSheetPopoverPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter presents action sheets in a popover, just as
 regular UIAlertControllers are displayed on an iPad.
 
 Since popovers have an arrow that should use the same color
 as the rest of the popover view, this presenter will remove
 any header view and combine items and buttons into a single
 item section.
 
 */

import UIKit

open class ActionSheetPopoverPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Dependencies
    
    var actionSheet: ActionSheet?
    weak var popover: UIPopoverPresentationController?
    
    
    // MARK: - Properties
    
    open var events = ActionSheetPresenterEvents()
    open var isDismissableWithTapOnBackground = true
    open var isListeningToOrientationChanges = true
    
    
    // MARK: - ActionSheetPresenter
    
    @objc public func handleOrientationChange() {
        dismiss {}
    }
    
    public func dismiss(completion: @escaping () -> ()) {
        let dismissAction = { completion();  self.actionSheet = nil }
        let presenter = actionSheet?.presentingViewController
        presenter?.dismiss(animated: true) { dismissAction() } ?? dismissAction()
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: @escaping () -> ()) {
        present(sheet, in: vc, view: view, completion: completion)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem, completion: @escaping () -> ()) {
        present(sheet, in: vc, item: item, completion: completion)
    }
    
    open func present(_ sheet: ActionSheet, in vc: UIViewController, view: UIView? = nil, item: UIBarButtonItem? = nil, completion: @escaping () -> ()) {
        self.actionSheet = sheet
        sheet.modalPresentationStyle = .popover
        popover = self.popover(for: sheet, in: vc)
        popover?.sourceView = view
        popover?.sourceRect = view?.bounds ?? CGRect()
        popover?.barButtonItem = item
        refreshPopoverBackgroundColor()
        vc.present(sheet, animated: true, completion: completion)
        setupOrientationChangeDetection()
    }
    
    open func refreshActionSheet() {
        guard let sheet = actionSheet else { return }
        sheet.items = popoverItems(for: sheet)
        sheet.buttons = []
        let hasHeader = sheet.headerView != nil
        sheet.headerViewContainer?.isHidden = !hasHeader
        sheet.buttonsTableView?.isHidden = true
        sheet.preferredContentSize.height = sheet.itemsHeight + (hasHeader ? sheet.headerViewContainerHeight!.constant + 15 : 0)
        if #available(iOS 10.0, *) {
            refreshPopoverBackgroundColor()
        }
    }
    
    open func refreshPopoverBackgroundColor() {
        popover?.backgroundColor = actionSheet?.itemsTableView?.backgroundColor ?? .white
    }
    
    open func setupOrientationChangeDetection(with center: NotificationCenter = .default) {
        let action = #selector(handleOrientationChange)
        let name = UIApplication.willChangeStatusBarOrientationNotification
        center.removeObserver(self, name: name, object: nil)
        guard isListeningToOrientationChanges else { return }
        center.addObserver(self, selector: action, name: name, object: nil)
    }
}


// MARK: - UIPopoverPresentationControllerDelegate

extension ActionSheetPopoverPresenter: UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    public func popoverPresentationControllerShouldDismissPopover(_ controller: UIPopoverPresentationController) -> Bool {
        guard isDismissableWithTapOnBackground else { return false }
        events.didDismissWithBackgroundTap?()
        dismiss {}
        return false
    }
    
    
}


// MARK: - Internal Functions

extension ActionSheetPopoverPresenter {
    
    func popover(for sheet: ActionSheet, in vc: UIViewController) -> UIPopoverPresentationController? {
        let popover = sheet.popoverPresentationController
        popover?.delegate = self
        return popover
    }
}


// MARK: - Private Functions

private extension ActionSheetPopoverPresenter {
    
    func popoverItems(for sheet: ActionSheet) -> [ActionSheetItem] {
        let items: [ActionSheetItem] = sheet.items + sheet.buttons
        return items.filter { !($0 is ActionSheetCancelButton) }
    }
}
