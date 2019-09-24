//
//  SelectItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class SelectItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
        
            it("is of correct type") {
                let item = SelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: nil)
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetSelectItemCell).to(beTrue())
                expect(item.actionSheetCellType is ActionSheetSelectItemCell.Type).to(beTrue())
            }
        }
    }
}
