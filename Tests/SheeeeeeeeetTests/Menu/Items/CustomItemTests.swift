//
//  CustomItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class CustomItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu button") {
            
            var didSetup = false
            
            it("sets up provided properties") {
                let item = CustomItem(itemType: TestType.self, itemSetupAction: { _ in didSetup = true })
                    
                expect(item.title).to(equal(""))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                
                expect(item.itemType).to(be(TestType.self))
                expect(item.itemSetupAction).toNot(beNil())
                
                expect(didSetup).to(beFalse())
                item.itemSetupAction(TestType())
                expect(didSetup).to(beTrue())
            }
        }
        
        describe("action sheet conversion") {
            
            it("can be converted to an action sheet item") {
                let source = CustomItem(itemType: TestType.self, itemSetupAction: { _ in })
                let item = source.toActionSheetItem() as? ActionSheetCustomItem<TestType>
                
                expect(item?.title).to(equal(""))
                expect(item?.subtitle).to(beNil())
                expect(item?.value).to(beNil())
                expect(item?.image).to(beNil())
                expect(item?.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                
                expect(item?.cellType).to(be(TestType.self))
                expect(item?.setupAction).toNot(beNil())
            }
        }
    }
}

private class TestType: ActionSheetItemCell, CustomItemType {
    
    static var defaultSize: CGSize { .zero }
}
