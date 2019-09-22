//
//  MultiSelectToggleItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class MultiSelectToggleItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("sets up provided properties") {
                let item = MultiSelectToggleItem(
                    title: "title",
                    state: .selectAll,
                    group: "group",
                    selectAllTitle: "select all",
                    deselectAllTitle: "deselect all"
                )
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                
                expect(item.state).to(equal(.selectAll))
                expect(item.group).to(equal("group"))
                expect(item.selectAllTitle).to(equal("select all"))
                expect(item.deselectAllTitle).to(equal("deselect all"))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = MultiSelectToggleItem(title: "", state: .selectAll, group: "", selectAllTitle: "", deselectAllTitle: "")
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetMultiSelectToggleItemCell).to(beTrue())
            }
        }
        
        
        describe("handling tap") {
            
            var menu: Menu!
            var item1: MultiSelectItem!
            var item2: MultiSelectItem!
            var item3: MultiSelectItem!
            var toggle1: MultiSelectToggleItem!
            var toggle2: MultiSelectToggleItem!
            
            func createItem(group: String) -> MultiSelectToggleItem {
                MultiSelectToggleItem(title: "foo", state: .selectAll, group: group, selectAllTitle: "select all", deselectAllTitle: "deselect all")
            }
            
            beforeEach {
                item1 = MultiSelectItem(title: "foo", isSelected: false, group: "group 1")
                item2 = MultiSelectItem(title: "bar", isSelected: false, group: "group 2")
                item3 = MultiSelectItem(title: "baz", isSelected: false, group: "group 1")
                toggle1 = createItem(group: "group 1")
                toggle2 = createItem(group: "group 3")
                menu = Menu(items: [item1, item2, item3, toggle1, toggle2])
            }
            
            it("resets state if no matching items exist in sheet") {
                toggle2.state = .deselectAll
                toggle2.handleSelection(in: menu)
                expect(toggle2.state).to(equal(.selectAll))
            }
            
            it("toggles select items in the same group") {
                toggle1.handleSelection(in: menu)
                expect(item1.isSelected).to(beTrue())
                expect(item2.isSelected).to(beFalse())
                expect(item3.isSelected).to(beTrue())
                expect(toggle1.state).to(equal(.deselectAll))
                expect(toggle2.state).to(equal(.selectAll))
                toggle1.handleSelection(in: menu)
                expect(item1.isSelected).to(beFalse())
                expect(item2.isSelected).to(beFalse())
                expect(item3.isSelected).to(beFalse())
                expect(toggle1.state).to(equal(.selectAll))
                expect(toggle2.state).to(equal(.selectAll))
                toggle2.handleSelection(in: menu)
                expect(item1.isSelected).to(beFalse())
                expect(item2.isSelected).to(beFalse())
                expect(item3.isSelected).to(beFalse())
                expect(toggle1.state).to(equal(.selectAll))
                expect(toggle2.state).to(equal(.selectAll))
            }
        }
    }
}
