//
//  SingleSelectItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class SingleSelectItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = SingleSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: nil)
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetSingleSelectItemCell).to(beTrue())
                expect(item.actionSheetCellType is ActionSheetSingleSelectItemCell.Type).to(beTrue())
            }
        }
    }
}
