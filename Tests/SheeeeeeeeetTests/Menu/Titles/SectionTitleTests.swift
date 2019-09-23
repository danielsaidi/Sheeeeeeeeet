//
//  SectionTitleTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SectionTitleTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetSectionTitleCell).to(beTrue())
                expect(item.cellType is ActionSheetSectionTitleCell.Type).to(beTrue())
            }
        }
    }
}
