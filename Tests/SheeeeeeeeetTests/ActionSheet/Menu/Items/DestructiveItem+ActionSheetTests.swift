//
//  DestructiveItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class DestructiveItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            describe("cell") {
                
                it("is of correct type") {
                    let item = DestructiveItem(title: "title")
                    let cell = item.actionSheetCell(for: UITableView())
                    expect(cell is ActionSheetDestructiveItemCell).to(beTrue())
                    expect(item.actionSheetCellType is ActionSheetDestructiveItemCell.Type).to(beTrue())
                }
            }
        }
    }
}
