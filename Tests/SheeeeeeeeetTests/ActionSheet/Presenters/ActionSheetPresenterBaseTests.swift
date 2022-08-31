//
//  ActionSheetPresenterBaseTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-18.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
import MockingKit
@testable import Sheeeeeeeeet

class ActionSheetPresenterBaseTests: QuickSpec {
    
    override func spec() {
        
        var presenter: TestClass!
        var notificationCenter: MockNotificationCenter!
        
        beforeEach {
            notificationCenter = MockNotificationCenter()
            presenter = TestClass(
                notificationCenter: notificationCenter
            )
        }
        

        // MARK: - Public Functions
        
        describe("dismissing") {
            
            it("does nothing") {}
        }
        
        describe("presenting action sheet") {
            
            it("sets up system detection") {
                let menu = Menu(items: [])
                let sheet = menu.toActionSheet { _, _ in }
                presenter.present(sheet, in: MockViewController(), completion: {})
                let inv1 = presenter.calls(to: presenter.setupDidEnterBackgroundDetectionRef)
                let inv2 = presenter.calls(to: presenter.setupOrientationChangeDetectionRef)
                expect(inv1.count).to(equal(1))
                expect(inv2.count).to(equal(1))
            }
        }
        
    
        // MARK: - Notifications
        
        describe("handling did enter background") {
            
            func sheet(withConfig config: ActionSheet.Configuration) -> ActionSheet {
                let menu = Menu(items: [])
                return ActionSheet(menu: menu, configuration: config) { _, _ in }
            }
            
            it("aborts if presenter has no action sheet") {
                presenter.handleDidEnterBackground()
                let inv = presenter.calls(to: presenter.dismissRef)
                expect(inv.count).to(equal(0))
            }
            
            it("aborts if action sheet is not dismissable") {
                presenter.actionSheet = sheet(withConfig: .nonDismissable)
                presenter.handleDidEnterBackground()
                let inv = presenter.calls(to: presenter.dismissRef)
                expect(inv.count).to(equal(0))
            }
            
            it("aborts if action sheet should not be dismissed") {
                let config = ActionSheet.Configuration(isDismissable: true, shouldBeDismissedWhenEnteringBackground: false)
                presenter.actionSheet = sheet(withConfig: config)
                presenter.handleDidEnterBackground()
                let inv = presenter.calls(to: presenter.dismissRef)
                expect(inv.count).to(equal(0))
            }
            
            it("dismisses if action sheet can and should be dismissed") {
                let config = ActionSheet.Configuration(isDismissable: true, shouldBeDismissedWhenEnteringBackground: true)
                presenter.actionSheet = sheet(withConfig: config)
                presenter.handleDidEnterBackground()
                let inv = presenter.calls(to: presenter.dismissRef)
                expect(inv.count).to(equal(1))
            }
        }
        
        describe("handling orientation change") {
            
            it("does nothing") {
                presenter.handleOrientationChange()
            }
        }
        
        describe("setting up didEnterBackgroundDetection") {
            
            beforeEach {
                presenter.setupDidEnterBackgroundDetection()
            }
            
            it("correctly unsubscribes from notification") {
                let inv = notificationCenter.calls(to: notificationCenter.removeObserverRef)
                expect(inv.count).to(equal(1))
                // expect(inv[0].arguments.0).to(be(presenter))
                expect(inv[0].arguments.1).to(equal(UIApplication.didEnterBackgroundNotification))
                expect(inv[0].arguments.2).to(beNil())
            }
            
            it("correctly subscribes to notification") {
                let inv = notificationCenter.calls(to: notificationCenter.addObserverRef)
                expect(inv.count).to(equal(1))
                // expect(inv[0].arguments.0).to(be(presenter))
                expect(inv[0].arguments.1).to(equal(#selector(presenter.handleDidEnterBackground)))
                expect(inv[0].arguments.2).to(equal(UIApplication.didEnterBackgroundNotification))
                expect(inv[0].arguments.3).to(beNil())
            }
        }
        
        describe("setting up willChangeStatusBarOrientationNotification") {
            
            beforeEach {
                presenter.setupOrientationChangeDetection()
            }
            
            it("correctly unsubscribes to notification") {
                let inv = notificationCenter.calls(to: notificationCenter.removeObserverRef)
                expect(inv.count).to(equal(1))
                // expect(inv[0].arguments.0).to(be(presenter))
                expect(inv[0].arguments.1).to(equal(UIApplication.willChangeStatusBarOrientationNotification))
                expect(inv[0].arguments.2).to(beNil())
            }
            
            it("correctly subscribes to notification") {
                let inv = notificationCenter.calls(to: notificationCenter.addObserverRef)
                expect(inv.count).to(equal(1))
                // expect(inv[0].arguments.0).to(be(presenter))
                expect(inv[0].arguments.1).to(equal(#selector(presenter.handleOrientationChange)))
                expect(inv[0].arguments.2).to(equal(UIApplication.willChangeStatusBarOrientationNotification))
                expect(inv[0].arguments.3).to(beNil())
            }
        }
    }
}


private class TestClass: ActionSheetPresenterBase, Mockable {
    
    lazy var dismissRef = MockReference(dismiss)
    lazy var setupDidEnterBackgroundDetectionRef = MockReference(setupDidEnterBackgroundDetection)
    lazy var setupOrientationChangeDetectionRef = MockReference(setupOrientationChangeDetection)
    
    var mock = Mock()
    
    override func dismiss(completion: @escaping () -> ()) {
        call(dismissRef, args: (completion))
    }
    
    override func setupDidEnterBackgroundDetection() {
        super.setupDidEnterBackgroundDetection()
        call(setupDidEnterBackgroundDetectionRef, args: ())
    }
    
    override func setupOrientationChangeDetection() {
        super.setupOrientationChangeDetection()
        call(setupOrientationChangeDetectionRef, args: ())
    }
}
