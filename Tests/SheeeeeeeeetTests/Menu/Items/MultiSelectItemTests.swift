//
//  MultiSelectItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class MultiSelectItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = MultiSelectItem(title: "title", isSelected: true)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.isSelected).to(beTrue())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
            
            it("sets up provided properties") {
                let image = UIImage()
                let item = MultiSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: image)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.isSelected).to(beTrue())
                expect(item.value as? Bool).to(beTrue())
                expect(item.image).to(be(image))
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = MultiSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: nil)
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetMultiSelectItemCell).to(beTrue())
                expect(item.cellType is ActionSheetMultiSelectItemCell.Type).to(beTrue())
            }
        }
        
        describe("handling selection in menu") {
            
            it("updates toggle item in the same group") {
                let item1 = MultiSelectItem(title: "foo", isSelected: false, group: "group 1")
                let item2 = MultiSelectItem(title: "bar", isSelected: false, group: "group 2")
                let item3 = MultiSelectItem(title: "baz", isSelected: false, group: "group 1")
                let toggle1 = MultiSelectToggleItem(title: "toggle 1", state: .selectAll, group: "group 1", selectAllTitle: "", deselectAllTitle: "")
                let toggle2 = MultiSelectToggleItem(title: "toggle 2", state: .selectAll, group: "group 2", selectAllTitle: "", deselectAllTitle: "")
                let menu = Menu(items: [item1, item2, item3, toggle1, toggle2])
                
                item1.handleSelection(in: menu)
                expect(toggle1.state).to(equal(.selectAll))
                expect(toggle2.state).to(equal(.selectAll))
                item2.handleSelection(in: menu)
                expect(toggle1.state).to(equal(.selectAll))
                expect(toggle2.state).to(equal(.deselectAll))
                item3.handleSelection(in: menu)
                expect(toggle1.state).to(equal(.deselectAll))
                expect(toggle2.state).to(equal(.deselectAll))
            }
        }
    }
}
