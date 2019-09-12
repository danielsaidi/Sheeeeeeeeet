//
//  ActionSheetPopoverPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This presenter presents action sheets in popovers. It's the
 default presenter on iPad devices, if the app has a regular
 horizontal size class.
 
 Since popovers have an arrow that should use the same color
 as the rest of the popover view, this presenter will remove
 any header view and combine items and buttons into a single
 item section.
 */
open class ActionSheetPopoverPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Dependencies
    
    var actionSheet: ActionSheet?
    weak var popover: UIPopoverPresentationController?
    
    
    // MARK: - Properties
    
    open var events = ActionSheetPresenterEvents()
    open var isDismissable = true
    open var isDismissableWithOrientationChange = true
    
    
    // MARK: - Deprecated
    
    @available(*, deprecated, renamed: "isDismissableWithOrientationChange")
    open var isListeningToOrientationChanges: Bool {
        get { isDismissableWithOrientationChange }
        set { isDismissableWithOrientationChange = newValue }
    }
    
    
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
        sheet.headerViewContainer.isHidden = true
        sheet.buttonsTableView.isHidden = true
        sheet.preferredContentSize.height = sheet.itemsHeight
        refreshPopoverBackgroundColor()
    }
    
    open func refreshPopoverBackgroundColor() {
        actionSheet?.backgroundView.isHidden = true
        actionSheet?.view.backgroundColor = ActionSheetTableView.appearance().backgroundColor
        popover?.backgroundColor = ActionSheetTableView.appearance().backgroundColor
    }
    
    open func setupOrientationChangeDetection(with center: NotificationCenter = .default) {
        let action = #selector(handleOrientationChange)
        let name = UIApplication.willChangeStatusBarOrientationNotification
        center.removeObserver(self, name: name, object: nil)
        guard isDismissable && isDismissableWithOrientationChange else { return }
        center.addObserver(self, selector: action, name: name, object: nil)
    }
}


// MARK: - UIPopoverPresentationControllerDelegate

extension ActionSheetPopoverPresenter: UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    public func popoverPresentationControllerShouldDismissPopover(_ controller: UIPopoverPresentationController) -> Bool {
        guard isDismissable else { return false }
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
