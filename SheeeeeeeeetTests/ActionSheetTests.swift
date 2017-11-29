//
//  ActionSheetTests.swift
//  SheeeeeeeeetTests
//
//  Created by Saidi Daniel (BookBeat) on 2017-11-28.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

fileprivate class ActionSheetTestClass: ActionSheet {
    
    var didPrepareForPresentation = 0
    
    override func prepareForPresentation() {
        super.prepareForPresentation()
        didPrepareForPresentation += 1
    }
}

class ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        func actionSheet(with items: [ActionSheetItem]) -> ActionSheet {
            return ActionSheet(items: items, action: { sheet, item in })
        }
        
        
        describe("creating an action sheet") {
            
            it("uses the provided items") {
                let item1 = ActionSheetItem(title: "foo")
                let item2 = ActionSheetItem(title: "bar")
                let items = [item1, item2]
                let sheet = actionSheet(with: items)
                
                expect(sheet.items.count).to(equal(2))
                expect(sheet.items.first!).to(be(item1))
                expect(sheet.items.last!).to(be(item2))
            }
            
            it("uses a default presenter by default") {
                let sheet = actionSheet(with: [])
                let presenter = sheet.presenter
                
                expect(presenter is DefaultActionSheetPresenter).to(beTrue())
            }
            
            it("uses the provided action") {
                var counter = 0
                let sheet = ActionSheet(items: []) { sheet, item in
                    counter += 1
                }
                sheet.itemSelectAction(sheet, ActionSheetItem(title: "foo"))
                
                expect(counter).to(equal(1))
            }
        }
        
        
        describe("setup") {
            
            it("makes view background clear") {
                let sheet = actionSheet(with: [])
                sheet.view.backgroundColor = .red
                sheet.setup()
                expect(sheet.view.backgroundColor).to(equal(UIColor.clear))
            }
        }
        
        
        describe("laying out subviews") {
            
            it("prepares for presentation") {
                let sheet = ActionSheetTestClass(items: [], action: { sheet, item in })
                sheet.viewDidLayoutSubviews()
                expect(sheet.didPrepareForPresentation).to(equal(1))
            }
        }
        
        
        describe("appearance") {
            
            it("copies standard appearance when lazily created") {
                let sheet = actionSheet(with: [])
                let appearance = sheet.appearance
                let standard = ActionSheetAppearance.standard
                expect(appearance.sectionMargin.height).to(equal(standard.sectionMargin.height))
            }
            
            it("does not copy standard appearance when manually set") {
                let sheet = actionSheet(with: [])
                let newApperance = ActionSheetAppearance()
                newApperance.sectionMargin.height = 121214
                sheet.appearance = newApperance
                let appearance = sheet.appearance
                expect(appearance.sectionMargin.height).to(equal(newApperance.sectionMargin.height))
            }
        }
        
        
        describe("content height") {
            
            let title = ActionSheetTitle(title: "foo")
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            let items = [title, item1, item2]
            var sheet: ActionSheet!
            
            beforeEach {
                sheet = actionSheet(with: items)
            }
            
            it("ignores unset header") {
                expect(sheet.contentHeight).to(equal(150))
            }
            
            it("considers set header") {
                sheet.appearance.headerView.bottomMargin = 30
                sheet.headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                expect(sheet.contentHeight).to(equal(280))
            }
        }
        
        
        describe("header view") {
            
            it("adds header view to action sheet view") {
                let sheet = actionSheet(with: [])
                let header = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                sheet.headerView = header
                expect(header.superview).to(be(sheet.view))
            }
            
            it("removes previous header view from superview") {
                let sheet = actionSheet(with: [])
                let header1 = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                let header2 = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                sheet.headerView = header1
                sheet.headerView = header2
                expect(header1.superview).to(beNil())
                expect(header2.superview).to(be(sheet.view))
            }
        }
        
        
        describe("preferred content size") {
            
            it("uses content height") {
                let item1 = ActionSheetItem(title: "foo")
                let item2 = ActionSheetItem(title: "bar")
                let items = [item1, item2]
                let sheet = actionSheet(with: items)
                sheet.preferredContentSize = CGSize(width: 10, height: 20)
                
                expect(sheet.preferredContentSize.height).to(equal(100))
            }
        }
        
        
        describe("preferred popover width") {
            
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            var sheet: ActionSheet!
            
            beforeEach {
                sheet = actionSheet(with: [item1, item2])
            }
            
            it("uses appearance width") {
                sheet.appearance.popover.width = 123
                expect(sheet.preferredPopoverSize.width).to(equal(123))
            }
            
            it("uses content height") {
                expect(sheet.preferredPopoverSize.height).to(equal(100))
            }
        }
        
        
        describe("table view") {
            
            it("is lazily created") {
                let sheet = actionSheet(with: [])
                expect(sheet.tableView.isScrollEnabled).to(beFalse())
            }
        }
    }
}
