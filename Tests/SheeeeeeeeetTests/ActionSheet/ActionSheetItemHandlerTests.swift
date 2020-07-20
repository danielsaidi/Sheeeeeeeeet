//
//  ActionSheetItemHandlerTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sheeeeeeeeet

class ActionSheetItemHandlerTests: QuickSpec {
    
    override func spec() {
        
        func createTableView() -> MockItemTableView {
            MockItemTableView(frame: .zero)
        }
        
        var sheet: MockActionSheet!
        var handler: ActionSheetItemHandler!
        var item1: MockMenuItem!
        var item2: MenuButton!
        var item3: MockMenuItem!
        
        beforeEach {
            item1 = MockMenuItem(title: "1")
            item2 = CancelButton(title: "2")
            item3 = MockMenuItem(title: "3")
            let menu = Menu(items: [item1, item2, item3])
            sheet = MockActionSheet(menu: menu) { _, _ in }
            handler = ActionSheetItemHandler(actionSheet: sheet, itemType: .items)
        }
        
        
        describe("configured with item type") {
            
            beforeEach {
                handler = ActionSheetItemHandler(actionSheet: sheet, itemType: .items)
            }
            
            it("uses action sheet items") {
                let items = handler.items
                expect(items.count).to(equal(2))
                expect(items[0].title).to(equal("1"))
                expect(items[1].title).to(equal("3"))
            }
        }
        
        
        describe("configured with button type") {
            
            beforeEach {
                handler = ActionSheetItemHandler(actionSheet: sheet, itemType: .buttons)
            }
            
            it("uses action sheet buttons") {
                let items = handler.items
                expect(items.count).to(equal(1))
                expect(items[0].title).to(equal("2"))
            }
        }
        
        
        describe("when used as table view data source") {
            
            it("returns correct item at index") {
                let path1 = IndexPath(row: 0, section: 0)
                let path2 = IndexPath(row: 1, section: 0)
                expect(handler.item(at: path1)!.title).to(equal("1"))
                expect(handler.item(at: path2)!.title).to(equal("3"))
            }
            
            it("has correct section count") {
                let sections = handler.numberOfSections(in: createTableView())
                expect(sections).to(equal(1))
            }
            
            it("has correct row count") {
                let rows = handler.tableView(createTableView(), numberOfRowsInSection: 0)
                expect(rows).to(equal(2))
            }
            
            it("returns correct cell for existing item") {
                let path = IndexPath(row: 0, section: 0)
                item1.cell = ActionSheetItemCell(frame: .zero)
                let result = handler.tableView(createTableView(), cellForRowAt: path)
                expect(result).to(be(item1.cell))
            }
            
            it("returns fallback cell for existing item") {
                let path = IndexPath(row: 1, section: 1)
                let result = handler.tableView(createTableView(), cellForRowAt: path)
                expect(result).toNot(beNil())
            }
            
            it("returns correct height for existing item") {
                ActionSheetItemCell.appearance().height = 123
                let path = IndexPath(row: 0, section: 0)
                let result = handler.tableView(createTableView(), heightForRowAt: path)
                expect(result).to(equal(123))
            }
            
            it("returns correct height for existing button") {
                handler = ActionSheetItemHandler(actionSheet: sheet, itemType: .buttons)
                ActionSheetCancelButtonCell.appearance().height = 456
                let path = IndexPath(row: 0, section: 0)
                let result = handler.tableView(createTableView(), heightForRowAt: path)
                expect(result).to(equal(456))
            }
            
            it("returns zero height for non-existing item") {
                let path = IndexPath(row: 1, section: 1)
                let result = handler.tableView(createTableView(), heightForRowAt: path)
                expect(result).to(equal(0))
            }
        }
        
        
        describe("when used as table view delegate") {
            
            it("does not deselect row for invalid path") {
                let path = IndexPath(row: 1, section: 1)
                let view = createTableView()
                handler.tableView(view, didSelectRowAt: path)
                expect(view.deselectRowInvokeCount).to(equal(0))
            }
            
            it("deselects row for valid path") {
                let path = IndexPath(row: 0, section: 0)
                let view = createTableView()
                handler.tableView(view, didSelectRowAt: path)
                expect(view.deselectRowInvokeCount).to(equal(1))
                expect(view.deselectRowInvokePaths.count).to(equal(1))
                expect(view.deselectRowInvokePaths[0]).to(equal(path))
                expect(view.deselectRowInvokeAnimated.count).to(equal(1))
                expect(view.deselectRowInvokeAnimated[0]).to(beTrue())
            }
            
            it("does not handle tap if missing action sheet") {
                handler.actionSheet = nil
                let path = IndexPath(row: 0, section: 0)
                handler.tableView(createTableView(), didSelectRowAt: path)
                expect(item1.handleTapInvokeCount).to(equal(0))
            }
            
            it("handles item tap for existing action sheet") {
                let path = IndexPath(row: 0, section: 0)
                handler.tableView(createTableView(), didSelectRowAt: path)
                expect(item1.handleTapInvokeCount).to(equal(1))
                expect(item1.handleTapInvokeMenus.count).to(equal(1))
                expect(item1.handleTapInvokeMenus[0]).to(be(sheet.menu))
            }

            it("handles sheet item tap for existing action sheet") {
                let path = IndexPath(row: 0, section: 0)
                handler.tableView(createTableView(), didSelectRowAt: path)
                let execs = sheet.invokations(of: sheet.handleTapRef)
                expect(execs.count).to(equal(1))
                expect(execs[0].arguments).to(be(item1))
            }
        }
    }
}
