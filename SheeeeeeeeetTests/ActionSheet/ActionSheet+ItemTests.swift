//
//  ActionSheet+ItemTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-16.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheet_ItemTests: QuickSpec {
    
    override func spec() {
        
        describe("items of type") {
            
            it("only return castable items") {
                let item1 = ActionSheetItem(title: "")
                let item2 = ActionSheetSelectItem(title: "", isSelected: true)
                let item3 = ActionSheetSingleSelectItem(title: "", isSelected: false)
                let item4 = ActionSheetMultiSelectItem(title: "", isSelected: false)
                let items = [item1, item2, item3, item4]
                let sheet = ActionSheet(items: items) { (_, _) in }
                let matches = sheet.items(ofType: ActionSheetSelectItem.self)
                
                expect(matches.count).to(equal(3))
                expect(matches[0]).to(be(item2))
                expect(matches[1]).to(be(item3))
                expect(matches[2]).to(be(item4))
            }
        }
    }
}
