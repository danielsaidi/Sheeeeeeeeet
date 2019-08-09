//
//  ActionSheet+AppearanceTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble

class ActionSheet_AppearanceTests: QuickSpec {
    
    override func spec() {
        
        describe("applying standard sheet appearance") {
            
            beforeEach {
                ActionSheet.applyStandardAppearance()
            }
            
            it("applies standard header appearance") {
                let header = ActionSheetHeaderView.appearance()
                expect(header.backgroundColor).to(equal(.clear))
                expect(header.cornerRadius).to(equal(10))
            }
            
            it("applies item appearance") {
                let item = ActionSheetItemCell.appearance()
                expect(item.backgroundColor).to(equal(.color(for: .background)))
                expect(item.titleColor).to(equal(.color(for: .text)))
                expect(item.titleColor).to(equal(.color(for: .text)))
            }
            
            it("applies standard table appearances") {
                let table = ActionSheetTableView.appearance()
                expect(table.backgroundColor).to(equal(.color(for: .background)))
                expect(table.cornerRadius).to(equal(10))
            }
        }
    }
}
