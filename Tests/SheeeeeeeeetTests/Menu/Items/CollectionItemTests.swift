//
//  CollectionItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import CoreGraphics
import Sheeeeeeeeet

class CollectionItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            var didSetup = false
            var didSelect = false
            
            it("sets up provided properties") {
                let item = CollectionItem(itemType: TestType.self, itemCount: 100, itemSetupAction: { _, _ in didSetup = true }, itemSelectionAction: { _, _ in didSelect = true })
                    
                expect(item.title).to(equal(""))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                
                expect(item.itemType).to(be(TestType.self))
                expect(item.itemCount).to(equal(100))
                expect(item.itemSetupAction).toNot(beNil())
                expect(item.itemSelectionAction).toNot(beNil())
                
                expect(didSetup).to(beFalse())
                expect(didSelect).to(beFalse())
                item.itemSetupAction(TestType(), 1)
                expect(didSetup).to(beTrue())
                expect(didSelect).to(beFalse())
                item.itemSelectionAction(TestType(), 1)
                expect(didSetup).to(beTrue())
                expect(didSelect).to(beTrue())
            }
        }
    }
}

private class TestType: CollectionItemType {
    
    static var preferredSize: CGSize { .zero }
    static var leftInset: CGFloat { 0 }
    static var rightInset: CGFloat { .zero }
    static var topInset: CGFloat { .zero }
    static var bottomInset: CGFloat { .zero }
    static var itemSpacing: CGFloat { .zero }
}
