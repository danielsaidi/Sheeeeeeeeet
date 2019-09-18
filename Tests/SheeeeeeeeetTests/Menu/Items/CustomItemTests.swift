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
                let item = CustomItem(
                    itemType: TestType.self,
                    itemSetupAction: { _ in didSetup = true }
                )
                    
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
    }
}

private class TestType: ActionSheetItemCell, ActionSheetCustomItemCell {
    
    static var nib: UINib { fatalError() }
    static var defaultSize: CGSize { fatalError() }
}
