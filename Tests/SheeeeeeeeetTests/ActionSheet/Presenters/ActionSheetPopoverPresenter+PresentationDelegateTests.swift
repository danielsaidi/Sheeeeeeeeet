//
//  ActionSheetPopoverPresenter+PresentationDelegateTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetPopoverPresenter_PresentationDelegateTests: QuickSpec {
    
    override func spec() {
        
        var presenter: ActionSheetPopoverPresenter!
        var sheet: MockActionSheet!
    
        beforeEach {
            let menu = Menu(items: [])
            sheet = MockActionSheet(menu: menu) { (_, _) in }
            presenter = ActionSheetPopoverPresenter()
            presenter.actionSheet = sheet
        }
        
        describe("presenter") {
            
            it("is self") {
                let delegate = presenter.presentationDelegate
                expect(delegate.presenter).to(be(presenter))
            }
        }
        
        describe("adaptive presentation style") {
            
            it("is none") {
                let delegate = presenter.presentationDelegate
                let controller = UIPresentationController(presentedViewController: MockViewController(), presenting: nil)
                let result = delegate.adaptivePresentationStyle(for: controller)
                expect(result).to(equal(UIModalPresentationStyle.none))
            }
        }

        describe("should dismiss popover") {
            
            var popover: UIPopoverPresentationController!
            var presenting: MockViewController!
            var dismissEventCount: Int!
            
            beforeEach {
                popover = UIPopoverPresentationController(presentedViewController: UIViewController(), presenting: nil)
                presenting = MockViewController()
                sheet.presentingViewController = presenting
                dismissEventCount = 0
                presenter.events.didDismissWithBackgroundTap = { dismissEventCount += 1 }
            }
            
            it("aborts and returns false if action sheet is not dismissable") {
                sheet.configuration = .nonDismissable
                let result = presenter.presentationDelegate.popoverPresentationControllerShouldDismissPopover(popover)
                expect(result).to(beFalse())
                expect(dismissEventCount).to(equal(0))
                expect(presenting.dismissInvokeCount).to(equal(0))
            }
            
            it("completes and returns false if action sheet is dismissable") {
                sheet.configuration = .standard
                let result = presenter.presentationDelegate.popoverPresentationControllerShouldDismissPopover(popover)
                expect(result).to(beFalse())
                expect(dismissEventCount).to(equal(1))
                expect(presenting.dismissInvokeCount).to(equal(1))
            }
        }
    }
}
