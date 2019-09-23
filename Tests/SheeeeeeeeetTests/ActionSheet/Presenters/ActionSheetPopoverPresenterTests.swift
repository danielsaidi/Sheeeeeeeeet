//
//  ActionSheetPopoverPresenterTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-18.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetPopoverPresenterTests: QuickSpec {
    
    override func spec() {
        
        var presenter: TestPresenter!
        var sheet: MockActionSheet!
        
        beforeEach {
            let items: [MenuItem] = [
                SingleSelectItem(title: "item 1", isSelected: true),
                CancelButton(title: "cancel"),
                OkButton(title: "ok"),
                MultiSelectItem(title: "item 2", isSelected: true)
            ]
            let menu = Menu(items: items)
            sheet = MockActionSheet(menu: menu) { (_, _) in }
            presenter = TestPresenter()
            presenter.actionSheet = sheet
        }
        
        
        describe("background tap dismissal") {
            
            it("is enabled by default") {
                expect(presenter.isDismissable).to(beTrue())
            }
        }
        
        
        describe("orientation change detection") {
            
            it("is enabled by default") {
                expect(presenter.isDismissable).to(beTrue())
            }
        }
        
        
        describe("dismissing") {
            
            it("completes dismissal directly if action sheet has no presenting view controller") {
                var count = 0
                presenter.dismiss { count += 1 }
                
                expect(count).to(equal(1))
                expect(presenter.actionSheet).to(beNil())
            }
            
            it("completes dismissal after presenting view controller has finished dismissing") {
                var count = 0
                let vc = MockViewController()
                sheet.presentingViewController = vc
                presenter.dismiss { count += 1 }
                
                expect(vc.dismissInvokeCount).to(equal(1))
                expect(vc.dismissInvokeAnimateds).to(equal([true]))
                expect(vc.dismissInvokeCompletions.count).to(equal(1))
                expect(count).to(equal(0))
                expect(presenter.actionSheet).toNot(beNil())
                
                vc.completeDismissal()
                
                expect(count).to(equal(1))
                expect(presenter.actionSheet).to(beNil())
            }
        }
        
        
        describe("presenting action sheet") {
            
            var vc: MockViewController!
            var item: UIBarButtonItem!
            var view: UIView!
            var completion: (() -> ())!
            
            beforeEach {
                vc = MockViewController()
                item = UIBarButtonItem(customView: UIView(frame: .zero))
                view = UIView(frame: CGRect(x: 1, y: 2, width: 3, height: 4))
                completion = {}
            }
            
            it("sets up sheet") {
                presenter.present(sheet, in: vc, completion: completion)
                expect(sheet.modalPresentationStyle).to(equal(.popover))
            }
            
            it("sets up popover") {
                presenter.present(sheet, in: vc, completion: completion)
                expect(presenter.popover?.delegate).to(be(presenter))
            }
            
            it("sets up popover from view") {
                presenter.present(sheet: sheet, in: vc, from: view, completion: completion)
                expect(presenter.popover?.delegate).to(be(presenter))
                expect(presenter.popover?.barButtonItem).to(beNil())
                expect(presenter.popover?.sourceView).to(be(view))
                expect(presenter.popover?.sourceRect).to(equal(view.bounds))
            }
            
            it("sets up popover from bar button item") {
                presenter.present(sheet: sheet, in: vc, from: item, completion: completion)
                expect(presenter.popover?.delegate).to(be(presenter))
                expect(presenter.popover?.barButtonItem).to(be(item))
                expect(presenter.popover?.sourceView).to(beNil())
                expect(presenter.popover?.sourceRect).to(equal(.zero))
            }
            
            it("performs presentation") {
                presenter.present(sheet, in: vc, completion: completion)
                expect(vc.presentInvokeCount).to(equal(1))
                expect(vc.presentInvokeVcs).to(equal([sheet]))
                expect(vc.presentInvokeAnimateds).to(equal([true]))
                expect(vc.presentInvokeCompletions.count).to(equal(1))
            }
            
            it("sets up orientation change detection with default center") {
                presenter.present(sheet, in: vc, completion: completion)
                let expected = NotificationCenter.default
                expect(presenter.setupOrientationChangeDetectionInvokeCount).to(equal(1))
                expect(presenter.setupOrientationChangeDetectionInvokeCenters[0]).to(be(expected))
            }
        }
        
        
        describe("refreshing action sheet") {
            
            beforeEach {
                ActionSheetItemCell.appearance().height = 50
                ActionSheetTableView.appearance().backgroundColor = .red
                presenter.present(sheet: sheet, in: UIViewController(), from: UIView()) {}
                presenter.refreshActionSheet()
            }
            
            it("adjusts items and buttons for popover") {
                expect(sheet.items.count).to(equal(3))
                expect(sheet.buttons.count).to(equal(0))
                expect(sheet.items[0] is SingleSelectItem).to(beTrue())
                expect(sheet.items[1] is MultiSelectItem).to(beTrue())
                expect(sheet.items[2] is OkButton).to(beTrue())
            }
            
            it("removes header corner radius") {
                expect(sheet.headerViewContainer.cornerRadius).to(equal(0))
            }
            
            it("hides unused views") {
                expect(sheet.backgroundView.isHidden).to(beTrue())
                expect(sheet.buttonsTableView.isHidden).to(beTrue())
            }
            
            it("does not hide header by default") {
                expect(sheet.headerViewContainer.isHidden).to(beFalse())
            }
            
            it("hides header if configuration says so") {
                sheet.headerViewConfiguration = ActionSheet.HeaderViewConfiguration(isVisibleInLandscape: true, isVisibleInPopover: false)
                presenter.refreshActionSheet()
                expect(sheet.headerViewContainer.isHidden).to(beTrue())
            }
            
            it("resizes popover") {
                // TODO: Why doesn't this take? expect(sheet.preferredContentSize.height).to(equal(150))
            }
            
            it("applies color to popover arrow") {
                expect(presenter.popover?.backgroundColor).to(equal(.red))
            }
        }
        
        
        describe("setting up orientation change detection") {
            
            var center: MockNotificationCenter!
            let expectedName = UIApplication.willChangeStatusBarOrientationNotification
            
            beforeEach {
                center = MockNotificationCenter()
            }
            
            it("removes observer") {
                presenter.setupOrientationChangeDetection(with: center)
                expect(center.removeObserverInvokeCount).to(equal(1))
                expect(center.removeObserverInvokeNames[0]).to(equal(expectedName))
                expect(center.removeObserverInvokeObjects[0]).to(beNil())
            }
            
            it("does not add observer if presenter is not listening for changes") {
                presenter.isDismissableWithOrientationChange = false
                presenter.setupOrientationChangeDetection(with: center)
                expect(center.addObserverInvokeCount).to(equal(0))
            }
            
            it("adds observer if presenter is listening for changes") {
                presenter.isDismissableWithOrientationChange = true
                presenter.setupOrientationChangeDetection(with: center)
                expect(center.addObserverInvokeCount).to(equal(1))
                expect(center.addObserverInvokeNames[0]).to(equal(expectedName))
                expect(center.addObserverInvokeObjects[0]).to(beNil())
            }
        }
        
        
        describe("popover should dismiss") {
            
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
            
            it("aborts and returns false if background tap is disabled") {
                presenter.isDismissable = false
                let result = presenter.popoverPresentationControllerShouldDismissPopover(popover)
                
                expect(result).to(beFalse())
                expect(dismissEventCount).to(equal(0))
                expect(presenting.dismissInvokeCount).to(equal(0))
            }
            
            it("completes and returns false if background tap is enabled") {
                presenter.isDismissable = true
                let result = presenter.popoverPresentationControllerShouldDismissPopover(popover)
                
                expect(result).to(beFalse())
                expect(dismissEventCount).to(equal(1))
                expect(presenting.dismissInvokeCount).to(equal(1))
            }
        }
    }
}


private class TestPresenter: ActionSheetPopoverPresenter {
    
    var setupOrientationChangeDetectionInvokeCount = 0
    var setupOrientationChangeDetectionInvokeCenters = [NotificationCenter]()
    override func setupOrientationChangeDetection(with center: NotificationCenter = .default) {
        super.setupOrientationChangeDetection(with: center)
        setupOrientationChangeDetectionInvokeCount += 1
        setupOrientationChangeDetectionInvokeCenters.append(center)
    }
}
