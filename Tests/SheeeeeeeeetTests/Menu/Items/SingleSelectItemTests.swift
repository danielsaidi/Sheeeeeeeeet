//
//  SingleSelectItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SingleSelectItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = SingleSelectItem(title: "title", isSelected: true)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.isSelected).to(beTrue())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(.dismiss))
            }
            
            it("sets up provided properties") {
                let image = UIImage()
                let item = SingleSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: image)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.isSelected).to(beTrue())
                expect(item.value as? Bool).to(beTrue())
                expect(item.image).to(be(image))
                expect(item.tapBehavior).to(equal(.dismiss))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = SingleSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: nil)
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetSingleSelectItemCell).to(beTrue())
                expect(item.cellType is ActionSheetSingleSelectItemCell.Type).to(beTrue())
            }
        }
        
        describe("handling selection in menu") {
            
            it("deselects other single select items in the same group") {
                let item1 = SingleSelectItem(title: "foo", isSelected: false, group: "group 1")
                let item2 = SingleSelectItem(title: "bar", isSelected: false, group: "group 2")
                let item3 = SingleSelectItem(title: "baz", isSelected: false, group: "group 1")
                let menu = Menu(items: [item1, item2, item3])
                
                item1.handleSelection(in: menu)
                expect(item1.isSelected).to(beTrue())
                expect(item2.isSelected).to(beFalse())
                expect(item3.isSelected).to(beFalse())
                item2.handleSelection(in: menu)
                expect(item1.isSelected).to(beTrue())
                expect(item2.isSelected).to(beTrue())
                expect(item3.isSelected).to(beFalse())
                item3.handleSelection(in: menu)
                expect(item1.isSelected).to(beFalse())
                expect(item2.isSelected).to(beTrue())
                expect(item3.isSelected).to(beTrue())
            }
        }
    }
}
