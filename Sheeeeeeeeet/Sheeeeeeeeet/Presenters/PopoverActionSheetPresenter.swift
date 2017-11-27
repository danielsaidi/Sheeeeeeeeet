//
//  PopoverActionSheetPresenter.swift
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
 
 Since a popover has an arrow that should use the same color
 as the rest of the popover view, this presenter will remove
 any header view that is set for the action sheet. It should
 not even be needed, since a popover points at the object it
 will affect.
 
 */

import UIKit


// MARK: - ActionSheetPresenter

open class PopoverActionSheetPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Properties
    
    fileprivate var actionSheetBackgroundColor: UIColor?
    fileprivate var actionSheetHeaderView: UIView?
    
    
    
    // MARK: - ActionSheetPresenter
    
    public func dismiss(sheet: ActionSheet, completion: (() -> ())?) {
        sheet.presentingViewController?.dismiss(animated: true, completion: completion)
        sheet.view.backgroundColor = actionSheetBackgroundColor
        sheet.headerView = actionSheetHeaderView
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: (() -> ())?) {
        guard sheet.contentHeight > 0 else { return }
        adjustSheetForPopoverPresentation(sheet)
        sheet.preferredContentSize = sheet.preferredPopoverSize
        let popover = getPopoverPresentationController(for: sheet, in: vc)
        setup(popover: popover, for: view)
        vc.present(sheet, animated: true, completion: completion)
    }
}


// MARK: - Private Functions

fileprivate extension PopoverActionSheetPresenter {
    
    func adjustSheetForPopoverPresentation(_ sheet: ActionSheet) {
        actionSheetBackgroundColor = sheet.view.backgroundColor
        sheet.view.backgroundColor = sheet.tableView.backgroundColor
        actionSheetHeaderView = sheet.headerView
        sheet.headerView = nil
    }
    
    func getPopoverPresentationController(for sheet: ActionSheet, in vc: UIViewController) -> UIPopoverPresentationController? {
        sheet.modalPresentationStyle = .popover
        let popover = sheet.popoverPresentationController
        popover?.backgroundColor = sheet.view.backgroundColor
        popover?.delegate = vc as? UIPopoverPresentationControllerDelegate
        return popover
    }
    
    func setup(popover: UIPopoverPresentationController?, for view: UIView?) {
        guard let view = view else { return }
        popover?.sourceView = view
        let bounds = view.bounds
        var center = bounds.origin
        center.x += bounds.size.width / 2
        center.y += bounds.size.height / 2
        popover?.sourceRect = CGRect(x: center.x, y: center.y, width: 1, height: 1)
    }
}
