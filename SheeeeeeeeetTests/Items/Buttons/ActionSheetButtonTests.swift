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
            item = ActionSheetButton(title: "foo", value: true)
            self.prepareStandardAppearance()
        }
        
        afterEach {
            self.restoreStandardAppearance()
        }
        
        describe("when created") {
            
            it("applies provided values") {
                expect(item.title).to(equal("foo"))
                expect(item.value as? Bool).to(equal(true))
            }
        }
        
        describe("item type") {
            
            it("is button") {
                expect(item.itemType).to(equal(.button))
            }
        }
        
        describe("applying appearance") {
            
            it("applies standard copy if no custom appearance is set") {
                item.applyAppearance(ActionSheetAppearance.standard)
                expect(self.compare(item.appearance, ActionSheetAppearance.standard.okButton)).to(beTrue())
            }
            
            it("applies custom appearance if set") {
                let standard = ActionSheetAppearance.standard
                let custom = ActionSheetAppearance(copy: standard)
                item.customAppearance = custom.okButton
                item.applyAppearance(standard)
                expect(item.appearance).to(be(custom.okButton))
            }
        }
        
        describe("applying appearance to cell") {
            
            it("applies correct style") {
                let appearance = ActionSheetAppearance.standard
                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
                item.applyAppearance(appearance)
                item.applyAppearance(to: cell)
                expect(self.compare(cell, item: item, appearance: appearance.okButton, textAlignment: .center)).to(beTrue())
            }
        }
    }
}
