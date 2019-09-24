//
//  Menu+ContextMenuTests.swift
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

class Menu_ContextMenuTests: QuickSpec {
    
    override func spec() {

        describe("creating context menu") {
            
            it("succeeds if it can be converted to a context menu") {
                guard #available(iOS 13.0, *) else { return }
                let items = [MenuItem(title: "item")]
                let menu = Menu(title: "title", items: items)
                let contextMenu = try? menu.toContextMenu(action: { _ in }).get()
                expect(contextMenu).toNot(beNil())
                expect(contextMenu?.children.count).to(equal(1))
                expect(contextMenu?.children[0].title).to(equal("item"))
            }
            
            it("fails with unsupported item types if the it can't be converted to a context menu") {
                guard #available(iOS 13.0, *) else { return }
                let items = [MenuItem(title: "item"), OkButton(title: "ok")]
                let menu = Menu(title: "title", items: items)
                let result = menu.toContextMenu(action: { _ in })
                switch result {
                case .success: fail("The operation should fail")
                case .failure(let error):
                    switch error {
                    case .unsupportedItemTypes: return
                    default: fail("The operation failed with an incorrect error")
                    }
                }
            }
        }
    }
}

@available(iOS 11.0, *)
private class TestView: UIView {
    
    var recorder = Mock()
    
    override func addInteraction(_ interaction: UIInteraction) {
        recorder.invoke(addInteraction, args: (interaction))
    }
}
