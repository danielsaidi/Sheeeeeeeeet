//
//  ActionSheetPopoverPresenter+PresentationDelegate.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

extension ActionSheetPopoverPresenter {
    
    class PresentationDelegate: NSObject, UIPopoverPresentationControllerDelegate {
        
        init(presenter: ActionSheetPopoverPresenter) {
            self.presenter = presenter
            super.init()
        }
        
        unowned var presenter: ActionSheetPopoverPresenter
        
        public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            .none
        }
        
        public func popoverPresentationControllerShouldDismissPopover(_ controller: UIPopoverPresentationController) -> Bool {
            guard
                let config = presenter.actionSheet?.configuration,
                config.isDismissable
                else { return false }
            presenter.events.didDismissWithBackgroundTap?()
            presenter.dismiss {}
            return false
        }
    }
}
