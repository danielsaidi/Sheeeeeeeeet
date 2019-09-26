//
//  UIView+ContextMenuTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Mockery
import UIKit
@testable import Sheeeeeeeeet

class UIView_ContextMenuTests: QuickSpec {
    
    override func spec() {
        
        describe("adding context menu") {
            
            it("enables user interaction") {
                guard #available(iOS 13.0, *) else { return }
                let view = UIView()
                let menu = Menu(title: "title", items: [])
                _ = view.addContextMenu(menu) { (item) in }
                expect(view.isUserInteractionEnabled).to(beTrue())
            }
            
            it("adds interaction") {
                guard #available(iOS 13.0, *) else { return }
                let view = TestView()
                let menu = Menu(title: "title", items: [])
                _ = view.addContextMenu(menu) { (item) in }
                let exec = view.recorder.executions(of: view.addInteraction)
                expect(exec.count).to(equal(1))
            }
            
            it("returns correctly configured delegate") {
                guard #available(iOS 13.0, *) else { return }
                var count = 0
                let view = UIView()
                let menu = Menu(title: "title", items: [])
                let delegate = view.addContextMenu(menu) { (item) in count += 1 }
                expect(delegate.menu).to(be(menu))
                delegate.action(MenuItem(title: ""))
                expect(count).to(equal(1))
            }
        }
    
        
        describe("adding retained context menu") {
            
            it("retains correctly configured delegate") {
                guard #available(iOS 13.0, *) else { return }
                var count = 0
                let view = TestView()
                let menu = Menu(title: "title", items: [])
                view.addRetainedContextMenu(menu) { (item) in count += 1 }
                let delegate = view.contextMenuDelegate!
                expect(delegate.menu).to(be(menu))
                delegate.action(MenuItem(title: ""))
            }
        }
    }
}

@available(iOS 13.0, *)
private class TestView: UIView, ContextMenuDelegateRetainer {
    
    var recorder = Mock()
    var contextMenuDelegate: ContextMenuDelegate?
    
    override func addInteraction(_ interaction: UIInteraction) {
        recorder.invoke(addInteraction, args: (interaction))
    }
}
