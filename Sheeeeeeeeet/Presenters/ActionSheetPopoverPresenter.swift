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
 
 Since popovers cause flickering if they are still open when
 an app is resumed, this presenter will dismiss a sheet when
 the app resigns its active state or is terminated.
 
 */

import UIKit

open class ActionSheetPopoverPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Initialization
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Properties
    
    public var isDismissableWithTapOnBackground = true
    
    public fileprivate(set) var actionSheetView: UIView?
    
    public fileprivate(set) var backgroundView: UIView?
    
    fileprivate var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }
    
    fileprivate var sheet: ActionSheet?
    
    
    // MARK: - ActionSheetPresenter
    
    public func dismiss(completion: @escaping () -> ()) {
        sheet?.presentingViewController?.dismiss(animated: true) {
            completion()
            self.sheet = nil
        }
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
        return isDismissableWithTapOnBackground
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
        subscribeToNotifications()
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
        self.sheet = sheet
        sheet.headerView = nil
        sheet.items = popoverItems(for: sheet)
        sheet.buttons = []
        sheet.preferredContentSize = sheet.preferredPopoverSize
        sheet.view.backgroundColor = sheet.itemsView.backgroundColor
    }
    
    func subscribeToNotifications() {
        unsubscribeFromNotifications()
        let action = #selector(applicationWillClose)
        let notifications = [Notification.Name.UIApplicationWillResignActive, Notification.Name.UIApplicationWillTerminate]
        notifications.forEach {
            notificationCenter.addObserver(self, selector: action, name: $0, object: nil)
        }
    }
    
    func unsubscribeFromNotifications() {
        notificationCenter.removeObserver(self)
    }
}
