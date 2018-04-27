//
//  ActionSheetTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2017-11-28.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

private class ActionSheetTestClass: ActionSheet {
    
    var didDismiss = 0
    var didPrepareForPresentation = 0
    
    override func dismiss(completion: @escaping () -> ()) {
        super.dismiss { completion() }
        completion()
        didDismiss += 1
    }
    
    override func prepareForPresentation() {
        super.prepareForPresentation()
        didPrepareForPresentation += 1
    }
}

class ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        func actionSheet(withItems items: [ActionSheetItem]) -> ActionSheetTestClass {
            return ActionSheetTestClass(items: items, action: { _, _ in })
        }
        
        var sheet: ActionSheetTestClass!
        
        beforeEach {
            ActionSheetAppearance.standard.item.height = 50
            ActionSheetAppearance.standard.okButton.height = 20
            ActionSheetAppearance.standard.cancelButton.height = 30
            ActionSheetAppearance.standard.contentInset = 10
        }
        
        
        // MARK: - Initialization
        
        describe("creating an action sheet") {
            
            it("applies provided items") {
                let item1 = ActionSheetItem(title: "foo")
                let item2 = ActionSheetItem(title: "bar")
                let items = [item1, item2]
                let sheet = actionSheet(withItems: items)
                
                expect(sheet.items.count).to(equal(2))
                expect(sheet.items.first!).to(be(item1))
                expect(sheet.items.last!).to(be(item2))
            }
            
            it("separates provided items and buttons") {
                let button = ActionSheetOkButton(title: "Sheeeeeeeeet!")
                let item1 = ActionSheetItem(title: "foo")
                let item2 = ActionSheetItem(title: "bar")
                let sheet = actionSheet(withItems: [item1, item2, button])
                
                expect(sheet.items.count).to(equal(2))
                expect(sheet.items.first!).to(be(item1))
                expect(sheet.items.last!).to(be(item2))
                
                expect(sheet.buttons.count).to(equal(1))
                expect(sheet.buttons.first!).to(be(button))
            }
            
            it("applies default presenter if none is provided") {
                let sheet = actionSheet(withItems: [])
                expect(sheet.presenter).toNot(beNil())
            }
            
            it("applies provided presenter") {
                let presenter = ActionSheetPopoverPresenter()
                let sheet = ActionSheetTestClass(items: [], presenter: presenter, action: { _, _ in })
                expect(sheet.presenter).to(be(presenter))
            }
            
            it("applies provided action") {
                var counter = 0
                let sheet = ActionSheetTestClass(items: []) { _, _  in counter += 1 }
                sheet.itemSelectAction(sheet, ActionSheetItem(title: "foo"))
                expect(counter).to(equal(1))
            }
            
            it("applies copy of standard appearance") {
                let sheet = actionSheet(withItems: [])
                let appearance = sheet.appearance
                let standard = ActionSheetAppearance.standard
                expect(appearance.sectionMargin.height).to(equal(standard.sectionMargin.height))
            }
        }
        
        
        // MARK: - Setup
        
        describe("setup") {
            
            it("makes view background clear") {
                let sheet = actionSheet(withItems: [])
                sheet.view.backgroundColor = .red
                sheet.setup()
                expect(sheet.view.backgroundColor).to(equal(UIColor.clear))
            }
        }
        
        
        // MARK: - View Controller Lifecycle
        
        describe("laying out subviews") {
            
            it("prepares for presentation") {
                let sheet = actionSheet(withItems: [])
                sheet.viewDidLayoutSubviews()
                expect(sheet.didPrepareForPresentation).to(equal(1))
            }
        }
        
        
        // MARK: - Actions
        
        describe("item select action") {
            
            it("can be manually set") {
                var counter = 0
                let sheet = actionSheet(withItems: [])
                sheet.itemSelectAction = { _, _  in counter += 1 }
                sheet.itemSelectAction(sheet, ActionSheetItem(title: "foo"))
                expect(counter).to(equal(1))
            }
        }
        
        describe("item tap action") {
            
            var counter = 0
            
            beforeEach {
                counter = 0
                sheet = ActionSheetTestClass(items: []) { _, _  in counter += 1 }
            }
            
            it("triggers select action") {
                sheet.itemTapAction(ActionSheetItem(title: "foo"))
                expect(counter).to(beGreaterThan(0))
            }
            
            it("dismisses sheet if item should") {
                let item = ActionSheetItem(title: "foo")
                sheet.itemTapAction(item)
                expect(sheet.didDismiss).to(equal(1))
            }
            
            it("does not dismiss sheet if item should not") {
                let item = ActionSheetItem(title: "foo")
                item.tapBehavior = .none
                sheet.itemTapAction(item)
                expect(sheet.didDismiss).to(equal(0))
            }
        }
        
        
        // MARK: - Properties
        
        describe("buttons section height") {
            
            let ok = ActionSheetOkButton(title: "OK")
            let cancel = ActionSheetCancelButton(title: "Cancel")
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            
            it("is zero if sheet has no buttons") {
                let sheet = actionSheet(withItems: [item1, item2])
                expect(sheet.buttonsSectionHeight).to(equal(0))
            }
            
            it("has correct value if sheet has buttons") {
                let sheet = actionSheet(withItems: [item1, item2, ok, cancel])
                sheet.prepareForPresentation()
                expect(sheet.buttonsSectionHeight).to(equal(50))
            }
        }
        
        describe("buttons view height") {
            
            let ok = ActionSheetOkButton(title: "OK")
            let cancel = ActionSheetCancelButton(title: "Cancel")
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            
            it("is zero if sheet has no buttons") {
                let sheet = actionSheet(withItems: [item1, item2])
                expect(sheet.buttonsViewHeight).to(equal(0))
            }
            
            it("has correct value if sheet has buttons") {
                let sheet = actionSheet(withItems: [item1, item2, ok, cancel])
                sheet.prepareForPresentation()
                expect(sheet.buttonsViewHeight).to(equal(50))
            }
        }
        
        describe("content height") {
            
            let title = ActionSheetTitle(title: "Sheeeeeeeeet!")
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            let button = ActionSheetOkButton(title: "OK")
            
            context("with only items") {
                
                beforeEach {
                    sheet = actionSheet(withItems: [title, item1, item2])
                    sheet.prepareForPresentation()
                }
                
                it("has correct content height") {
                    expect(sheet.contentHeight).to(equal(150))
                }
            }
            
            context("with header") {
                
                beforeEach {
                    sheet = actionSheet(withItems: [title, item1, item2])
                    sheet.headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                    sheet.prepareForPresentation()
                }
                
                it("has correct content height") {
                    expect(sheet.contentHeight).to(equal(260))
                }
            }
            
            context("with buttons") {
                
                beforeEach {
                    sheet = actionSheet(withItems: [title, item1, item2, button])
                    sheet.prepareForPresentation()
                }
                
                it("has correct content height") {
                    expect(sheet.contentHeight).to(equal(180))
                }
            }
            
            context("with header and buttons") {
                
                beforeEach {
                    sheet = actionSheet(withItems: [title, item1, item2, button])
                    sheet.headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                    sheet.prepareForPresentation()
                }
                
                it("has correct content height") {
                    expect(sheet.contentHeight).to(equal(290))
                }
            }
        }
        
        describe("content width") {
            
            it("uses preferred content size width") {
                let sheet = actionSheet(withItems: [])
                sheet.preferredContentSize.width = 123
                expect(sheet.contentWidth).to(equal(123))
            }
        }
        
        describe("header total height") {
            
            it("is zero of sheet has no header view") {
                let sheet = actionSheet(withItems: [])
                expect(sheet.headerSectionHeight).to(equal(0))
            }
            
            it("has correct value if sheet has header view") {
                let sheet = actionSheet(withItems: [])
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                sheet.headerView = view
                expect(sheet.headerSectionHeight).to(equal(110))
            }
        }
        
        describe("header height") {
            
            it("is zero of sheet has no header view") {
                let sheet = actionSheet(withItems: [])
                sheet.prepareForPresentation()
                expect(sheet.headerViewHeight).to(equal(0))
            }
            
            it("has correct value if sheet has header view") {
                let sheet = actionSheet(withItems: [])
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                sheet.headerView = view
                expect(sheet.headerViewHeight).to(equal(100))
            }
        }
        
        describe("items total height") {
            
            let ok = ActionSheetOkButton(title: "OK")
            let cancel = ActionSheetCancelButton(title: "Cancel")
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            
            it("is zero if sheet has no items") {
                let sheet = actionSheet(withItems: [ok, cancel])
                expect(sheet.itemsSectionHeight).to(equal(0))
            }
            
            it("has correct value if sheet has items") {
                let sheet = actionSheet(withItems: [item1, item2, ok, cancel])
                sheet.prepareForPresentation()
                expect(sheet.itemsSectionHeight).to(equal(110))
            }
        }
        
        describe("items view height") {
            
            let ok = ActionSheetOkButton(title: "OK")
            let cancel = ActionSheetCancelButton(title: "Cancel")
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            
            it("is zero if sheet has no items") {
                let sheet = actionSheet(withItems: [ok, cancel])
                expect(sheet.itemsViewHeight).to(equal(0))
            }
            
            it("has correct value if sheet has items") {
                let sheet = actionSheet(withItems: [item1, item2, ok, cancel])
                sheet.prepareForPresentation()
                expect(sheet.itemsViewHeight).to(equal(100))
            }
        }
        
        describe("preferred content size") {
            
            it("uses content height") {
                let item1 = ActionSheetItem(title: "foo")
                let item2 = ActionSheetItem(title: "bar")
                let items = [item1, item2]
                let sheet = actionSheet(withItems: items)
                sheet.preferredContentSize = CGSize(width: 10, height: 20)
                
                expect(sheet.preferredContentSize.height).to(equal(100))
            }
        }
        
        describe("preferred popover width") {
            
            let item1 = ActionSheetItem(title: "foo")
            let item2 = ActionSheetItem(title: "bar")
            
            beforeEach {
                sheet = actionSheet(withItems: [item1, item2])
            }
            
            it("uses appearance width") {
                sheet.appearance.popover.width = 123
                expect(sheet.preferredPopoverSize.width).to(equal(123))
            }
            
            it("uses content height") {
                expect(sheet.preferredPopoverSize.height).to(equal(100))
            }
        }
        
        
        // MARK: - View Properties
        
        describe("buttons view") {
            
            it("is lazily created") {
                let sheet = actionSheet(withItems: [])
                let view = sheet.buttonsView
                expect(view.dataSource).to(be(sheet.buttonHandler))
                expect(view.delegate).to(be(sheet.buttonHandler))
                expect(view.isScrollEnabled).to(beFalse())
            }
        }
        
        describe("header view") {
            
            it("adds header view to action sheet view") {
                let sheet = actionSheet(withItems: [])
                let header = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                sheet.headerView = header
                expect(header.superview).to(be(sheet.view))
            }
            
            it("removes previous header view from superview") {
                let sheet = actionSheet(withItems: [])
                let header1 = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                let header2 = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
                sheet.headerView = header1
                sheet.headerView = header2
                expect(header1.superview).to(beNil())
                expect(header2.superview).to(be(sheet.view))
            }
        }
        
        describe("items view") {
            
            it("is lazily created") {
                let sheet = actionSheet(withItems: [])
                let view = sheet.itemsView
                expect(view.dataSource).to(be(sheet.itemHandler))
                expect(view.delegate).to(be(sheet.itemHandler))
                expect(view.isScrollEnabled).to(beFalse())
            }
        }
        
        
        // MARK: - Public Functions
        
        describe("setting up items and buttons with item array") {
            
            it("separates items into items and buttons") {
                let button = ActionSheetOkButton(title: "Sheeeeeeeeet!")
                let item1 = ActionSheetItem(title: "foo")
                let item2 = ActionSheetItem(title: "bar")
                let items = [item1, item2, button]
                let sheet = actionSheet(withItems: [])
                sheet.setupItemsAndButtons(with: items)
                
                expect(sheet.items.count).to(equal(2))
                expect(sheet.items.first!).to(be(item1))
                expect(sheet.items.last!).to(be(item2))
                
                expect(sheet.buttons.count).to(equal(1))
                expect(sheet.buttons.first!).to(be(button))
            }
        }
    }
}
