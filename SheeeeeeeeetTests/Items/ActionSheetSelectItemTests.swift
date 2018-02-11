//
//  ActionSheetSelectItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetSelectItemTests: QuickSpec {
    
    override func spec() {
        
        func getItem(isSelected: Bool) -> ActionSheetSelectItem {
            return ActionSheetSelectItem(title: "foo", isSelected: isSelected, value: true, image: UIImage())
        }
        
        describe("when created") {
            
            it("applies provided values") {
                let item = getItem(isSelected: true)
                expect(item.title).to(equal("foo"))
                expect(item.value as? Bool).to(equal(true))
                expect(item.image).toNot(beNil())
            }
            
            it("applies provided selection state") {
                expect(getItem(isSelected: true).isSelected).to(beTrue())
                expect(getItem(isSelected: false).isSelected).to(beFalse())
            }
        }
        
        describe("tap behavior") {
            
            it("is none") {
                let item = getItem(isSelected: true)
                expect(item.tapBehavior).to(equal(ActionSheetItem.TapBehavior.dismiss))
            }
        }
    }
}
