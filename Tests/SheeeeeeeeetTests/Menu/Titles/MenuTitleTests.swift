//
//  MenuTitleTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class MenuTitleTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu title") {
            
            it("configures itself to be non-tappable") {
                let item = MenuTitle(title: "foo", subtitle: "subtitle")
                expect(item.title).to(equal("foo"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = MenuTitle(title: "foo")
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetTitleCell).to(beTrue())
                expect(item.cellType is ActionSheetTitleCell.Type).to(beTrue())
            }
        }
    }
}
