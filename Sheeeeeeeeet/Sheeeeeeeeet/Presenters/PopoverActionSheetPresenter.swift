//
//  PopoverActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as popovers,
 just as regular UIAlertControllers are displayed when
 being displayed in actionsheet mode on an iPad.
 
 Only use this presenter when you know that you are on
 an iPad or when the UI can display popover on iPhones.
 
 */

import UIKit


// MARK: - ActionSheetPresenter

open class PopoverActionSheetPresenter: NSObject, ActionSheetPresenter {
    
    public func dismiss(sheet: ActionSheet, completion: (() -> ())?) {
        sheet.presentingViewController?.dismiss(animated: true, completion: completion)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: (() -> ())?) {
        guard sheet.contentHeight > 0 else { return }
        sheet.preferredContentSize = sheet.preferredPopoverSize
        let popover = getPopoverPresentationController(for: sheet, in: vc)
        setup(popover: popover, for: view)
        vc.present(sheet, animated: true, completion: completion)
    }
}


// MARK: - Private Functions

fileprivate extension PopoverActionSheetPresenter {
    
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

