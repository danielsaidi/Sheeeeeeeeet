//
//  SectionTitle_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class SectionTitle_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetSectionTitleCell).to(beTrue())
                expect(item.actionSheetCellType is ActionSheetSectionTitleCell.Type).to(beTrue())
            }
            
            it("uses correct style") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                expect(item.actionSheetCellStyle).to(equal(.value1))
            }
        }
    }
}
