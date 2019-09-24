//
//  MenuButton_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class MenuButton_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = MenuButton(title: "title", type: .cancel)
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetButtonCell).to(beTrue())
                expect(item.actionSheetCellType is ActionSheetButtonCell.Type).to(beTrue())
            }
        }
    }
}
