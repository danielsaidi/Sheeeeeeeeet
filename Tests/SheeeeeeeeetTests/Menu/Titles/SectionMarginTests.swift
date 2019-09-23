//
//  SectionMarginTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SectionMarginTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = SectionMargin()
                expect(item.title).to(equal(""))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = SectionMargin()
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetSectionMarginCell).to(beTrue())
                expect(item.cellType is ActionSheetSectionMarginCell.Type).to(beTrue())
            }
        }
    }
}
