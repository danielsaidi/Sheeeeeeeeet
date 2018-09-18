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
            return ActionSheetMultiSelectItem(title: "foo", isSelected: isSelected, value: true, image: UIImage())
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
        
        describe("when tapped") {
            
            var sheet: ActionSheet!
            
            beforeEach {
                sheet = ActionSheet(items: [
                    getItem(isSelected: true),
                    getItem(isSelected: false)
                    ], action: { _, _ in })
            }
            
            it("selects unselected item") {
                let item = getItem(isSelected: false)
                item.handleTap(in: sheet)
                expect(item.isSelected).to(beTrue())
            }
            
            it("deselects selected item") {
                let item = getItem(isSelected: true)
                item.handleTap(in: sheet)
                expect(item.isSelected).to(beFalse())
            }
            
            it("does not affect other sheet items") {
                let item = getItem(isSelected: true)
                item.handleTap(in: sheet)
                let items = sheet.items.compactMap { $0 as? ActionSheetSelectItem }
                expect(items.first!.isSelected).to(beTrue())
                expect(items.last!.isSelected).to(beFalse())
            }
        }
    }
}
