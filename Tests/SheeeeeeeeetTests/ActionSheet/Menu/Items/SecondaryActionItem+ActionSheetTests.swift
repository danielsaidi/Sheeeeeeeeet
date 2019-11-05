//
//  SecondaryActionItem+ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-11-01.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class SecondaryActionItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
        
            it("is of correct type") {
                let item = SecondaryActionItem(title: "title", secondaryAction: { _ in })
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetSecondaryActionItemCell).to(beTrue())
                expect(item.actionSheetCellType is ActionSheetSecondaryActionItemCell.Type).to(beTrue())
            }
        }
    }
}
