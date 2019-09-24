//
//  MultiSelectItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class MultiSelectItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = MultiSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: nil)
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetMultiSelectItemCell).to(beTrue())
                expect(item.actionSheetCellType is ActionSheetMultiSelectItemCell.Type).to(beTrue())
            }
        }
    }
}
