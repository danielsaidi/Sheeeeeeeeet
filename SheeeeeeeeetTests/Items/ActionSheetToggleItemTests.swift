//
//  ActionSheetToggleItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetToggleItemTests: QuickSpec {
    
    override func spec() {
        
        func getItem(isToggled: Bool) -> ActionSheetToggleItem {
            return ActionSheetToggleItem(title: "foo", isToggled: isToggled, value: true, image: UIImage())
        }
        
        describe("when created") {
            
            it("applies provided values") {
                let item = getItem(isToggled: true)
                expect(item.title).to(equal("foo"))
                expect(item.value as? Bool).to(equal(true))
                expect(item.image).toNot(beNil())
            }
            
            it("applies provided toggle state") {
                expect(getItem(isToggled: true).isToggled).to(beTrue())
                expect(getItem(isToggled: false).isToggled).to(beFalse())
            }
        }
        
        describe("tap behavior") {
            
            it("is none") {
                let item = getItem(isToggled: true)
                expect(item.tapBehavior).to(equal(ActionSheetItem.TapBehavior.none))
            }
        }
    }
}
