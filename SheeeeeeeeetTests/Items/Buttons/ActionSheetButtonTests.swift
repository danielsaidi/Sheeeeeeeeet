//
//  ActionSheetButtonTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetButtonTests: ActionSheetItemTests {
    
    override func spec() {
        
        var item: ActionSheetButton!
        
        beforeEach {
            item = ActionSheetButton(title: "foo", type: .ok)
        }
        
        describe("when created with value") {
            
            beforeEach {
                item = ActionSheetButton(title: "foo", value: "bar")
            }
            
            it("applies provided values") {
                expect(item.title).to(equal("foo"))
                expect(item.value as? String).to(equal("bar"))
            }
            
            it("is correctly setup") {
                expect(item.isOkButton).to(beFalse())
            }
        }
        
        describe("when created with type") {
            
            it("applies provided values") {
                expect(item.title).to(equal("foo"))
            }
            
            it("is correctly setup") {
                expect(item.value as? ActionSheetButton.ButtonType).to(equal(.ok))
                expect(item.isOkButton).to(beTrue())
            }
        }
    }
}
