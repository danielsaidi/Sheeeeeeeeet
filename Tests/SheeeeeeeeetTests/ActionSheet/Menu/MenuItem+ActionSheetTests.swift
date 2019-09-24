//
//  MenuItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class MenuItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is not nil") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell).toNot(beNil())
                expect(item.actionSheetCellType).toNot(beNil())
            }
        }
    }
}
