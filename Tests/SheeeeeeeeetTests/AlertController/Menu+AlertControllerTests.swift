//
//  Menu+AlertControllerTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import MockingKit
import UIKit
@testable import Sheeeeeeeeet

class Menu_AlertControllerTests: QuickSpec {
    
    override func spec() {

        describe("creating alert controller") {
            
            it("succeeds if all non-ignored items can be converted") {
                let items = [MenuItem(title: "item")]
                let menu = Menu(title: "title", items: items)
                let alertController = try? menu.toAlertController(action: { _ in }).get()
                expect(alertController).toNot(beNil())
                expect(alertController?.actions.count).to(equal(1))
                expect(alertController?.actions[0].title).to(equal("item"))
            }
            
            it("fails if any non-ignored item can't be converted") {
                let items = [MenuItem(title: "item"), OkButton(title: "ok")]
                let menu = Menu(title: "title", items: items)
                let result = menu.toAlertController(action: { _ in })
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
