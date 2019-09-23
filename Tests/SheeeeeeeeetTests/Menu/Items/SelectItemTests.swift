//
//  SelectItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SelectItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = SelectItem(title: "title", isSelected: true)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.isSelected).to(beTrue())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(.dismiss))
            }
            
            it("sets up provided properties") {
                let image = UIImage()
                let item = SelectItem(
                    title: "title",
                    subtitle: "subtitle",
                    isSelected: true,
                    value: true,
                    image: image,
                    tapBehavior: .none)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.isSelected).to(beTrue())
                expect(item.value as? Bool).to(beTrue())
                expect(item.image).to(be(image))
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("is of correct type") {
            
            it("can be converted to an action sheet item") {
                let item = SelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: nil)
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetSelectItemCell).to(beTrue())
                expect(item.cellType is ActionSheetSelectItemCell.Type).to(beTrue())
            }
        }
        
        describe("handling selection in menu") {
            
            it("toggles selected state") {
                let menu = Menu.empty
                let item = SelectItem(title: "title", subtitle: "subtitle", isSelected: false, value: true, image: nil)
                item.handleSelection(in: menu)
                expect(item.isSelected).to(beTrue())
                item.handleSelection(in: menu)
                expect(item.isSelected).to(beFalse())
            }
        }
    }
}
