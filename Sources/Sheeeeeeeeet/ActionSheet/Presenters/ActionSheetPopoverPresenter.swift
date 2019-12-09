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
 
 `TODO` Move `isDismissableWithOrientationChange` to config.
 */
open class ActionSheetPopoverPresenter: ActionSheetPresenterBase {
    
    
    // MARK: - Properties
    
    open var isDismissableWithOrientationChange = true
    
    weak var popover: UIPopoverPresentationController?
    
    lazy var presentationDelegate: PresentationDelegate = {
        PresentationDelegate(presenter: self)
    }()
    
    
    // MARK: - ActionSheetPresenter
    
    open override func dismiss(completion: @escaping () -> ()) {
        let dismissAction = { completion();  self.actionSheet = nil }
        let presenter = actionSheet?.presentingViewController
        presenter?.dismiss(animated: true) { dismissAction() } ?? dismissAction()
    }
    
    open override func present(_ sheet: ActionSheet, in vc: UIViewController, view: UIView? = nil, item: UIBarButtonItem? = nil, completion: @escaping () -> ()) {
        super.present(sheet, in: vc, view: view, item: item, completion: completion)
        self.actionSheet = sheet
        sheet.modalPresentationStyle = .popover
        popover = self.popover(for: sheet, in: vc)
        popover?.sourceView = view
        popover?.sourceRect = view?.bounds ?? CGRect()
        popover?.barButtonItem = item
        refreshPopoverBackgroundColor()
        vc.present(sheet, animated: true, completion: completion)
    }
    
    open override func refreshActionSheet() {
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
    
    
    // MARK: - Notifications
    
    @objc open override func handleOrientationChange() {
        guard let config = actionSheet?.configuration else { return }
        guard config.isDismissable && isDismissableWithOrientationChange else { return }
        dismiss {}
    }
}


// MARK: - Internal Functions

extension ActionSheetPopoverPresenter {
    
    func popover(for sheet: ActionSheet, in vc: UIViewController) -> UIPopoverPresentationController? {
        let popover = sheet.popoverPresentationController
        popover?.delegate = presentationDelegate
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
