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
    open var isDismissableWithOrientationChange = true
    
    
    // MARK: - ActionSheetPresenter
    
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
        setupDidEnterBackgroundDetection()
    }
    
    open func refreshActionSheet() {
        guard let sheet = actionSheet else { return }
        sheet.items = popoverItems(for: sheet)
        sheet.buttons = []
        sheet.stackView.spacing = 0
        sheet.headerViewContainer.cornerRadius = 0
        sheet.headerViewContainer.isHidden = !sheet.headerConfiguration.isVisibleInPopover
        sheet.buttonsTableView.isHidden = true
        refreshActionSheetHeight(for: sheet)
        refreshPopoverBackgroundColor()
    }
    
    func refreshActionSheetHeight(for sheet: ActionSheet) {
        let itemHeight = CGFloat(sheet.itemsHeight)
        let isHeaderHidden = sheet.headerViewContainer.isHidden
        let headerHeight = isHeaderHidden ? 0 : sheet.headerView?.frame.height ?? 0
        sheet.preferredContentSize.height = itemHeight + headerHeight
    }
    
    open func refreshPopoverBackgroundColor() {
        actionSheet?.backgroundView.isHidden = true
        actionSheet?.view.backgroundColor = ActionSheetTableView.appearance().backgroundColor
        popover?.backgroundColor = ActionSheetTableView.appearance().backgroundColor
    }
    
    open func setupDidEnterBackgroundDetection(with center: NotificationCenter = .default) {
        let action = #selector(handleDidEnterBackground)
        let name = UIApplication.didEnterBackgroundNotification
        center.removeObserver(self, name: name, object: nil)
        center.addObserver(self, selector: action, name: name, object: nil)
    }
    
    open func setupOrientationChangeDetection(with center: NotificationCenter = .default) {
        let action = #selector(handleOrientationChange)
        let name = UIApplication.willChangeStatusBarOrientationNotification
        center.removeObserver(self, name: name, object: nil)
        center.addObserver(self, selector: action, name: name, object: nil)
    }
}


// MARK: - Notification Handling

public extension ActionSheetPopoverPresenter {
    
    @objc func handleOrientationChange() {
        guard let config = actionSheet?.configuration else { return }
        guard config.isDismissable && isDismissableWithOrientationChange else { return }
        dismiss {}
    }
    
    @objc func handleDidEnterBackground() {
        guard let config = actionSheet?.configuration else { return }
        guard config.isDismissable && config.shouldBeDismissedWhenEnteringBackground else { return }
        dismiss {}
    }
}


// MARK: - UIPopoverPresentationControllerDelegate

extension ActionSheetPopoverPresenter: UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    public func popoverPresentationControllerShouldDismissPopover(_ controller: UIPopoverPresentationController) -> Bool {
        guard let config = actionSheet?.configuration, config.isDismissable else { return false }
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
    
    func popoverItems(for sheet: ActionSheet) -> [MenuItem] {
        let items: [MenuItem] = sheet.items + sheet.buttons
        return items.filter { !($0 is CancelButton) }
    }
}
