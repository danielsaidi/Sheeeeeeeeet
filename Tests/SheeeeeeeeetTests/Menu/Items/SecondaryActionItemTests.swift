//
//  SecondaryActionItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SecondaryActionItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                var count = 0
                let action: Menu.ItemAction = { _ in count += 1 }
                let item = SecondaryActionItem(title: "title", secondaryAction: action)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.isEnabled).to(beTrue())
                expect(item.tapBehavior).to(equal(.dismiss))
                expect(count).to(equal(0))
                item.secondaryAction(item)
                expect(count).to(equal(1))
            }
            
            it("sets up provided properties") {
                var count = 0
                let action: Menu.ItemAction = { _ in count += 1 }
                let image = UIImage()
                let item = SecondaryActionItem(
                    title: "title",
                    subtitle: "subtitle",
                    value: true,
                    image: image,
                    isEnabled: false,
                    tapBehavior: .none,
                    secondaryAction: action)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.value as? Bool).to(beTrue())
                expect(item.image).to(be(image))
                expect(item.isEnabled).to(beFalse())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                expect(count).to(equal(0))
                item.secondaryAction(item)
                expect(count).to(equal(1))
            }
        }
        
        describe("capabilities") {
            
            it("can't be used in alert controller") {
                let item = SecondaryActionItem(title: "title", secondaryAction: { _ in })
                expect(item.canBeUsedInAlertController).to(beFalse())
            }
            
            it("can't be used in native context menu") {
                let item = SecondaryActionItem(title: "title", secondaryAction: { _ in })
                expect(item.canBeUsedInContextMenu).to(beFalse())
            }
        }
    }
}
