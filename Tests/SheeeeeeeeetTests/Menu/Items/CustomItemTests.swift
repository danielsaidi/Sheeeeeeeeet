//
//  CustomItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class CustomItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu button") {
            
            var didSetup = false
            
            it("sets up provided properties") {
                let item = CustomItem(itemType: TestType.self, itemSetupAction: { _ in didSetup = true })
                    
                expect(item.title).to(equal(""))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                
                expect(item.itemType).to(be(TestType.self))
                expect(item.itemSetupAction).toNot(beNil())
                
                expect(didSetup).to(beFalse())
                item.itemSetupAction(TestType())
                expect(didSetup).to(beTrue())
            }
        }
        
        describe("action sheet") {
            
            describe("height") {
                
                it("is cell type's default height") {
                    let item = CustomItem(itemType: TestType.self, itemSetupAction: { _ in })
                    expect(item.height).to(equal(TestType.defaultSize.height))
                }
            }
            
            describe("cell") {
                
                it("registers nib, dequeues cell and sets up cell") {
                    // TODO: How to test this in SPM, which doesn't have a bundle?
                    // var actionCell: UITableViewCell?
                    // let type = ActionSheetCustomItemTestCell.self
                    // let item = ActionSheetCustomItem(cellType: type, setupAction: { cell in actionCell = cell })
                    // let tableView = MockTableView()
                    // let cell = item.cell(for: tableView)
                    //
                    // expect(tableView.registerNibInvokeCount).to(equal(1))
                    // expect(tableView.registerNibInvokeNibs.count).to(equal(1))
                    // expect(tableView.registerNibInvokeNibs[0]).to(be(ActionSheetCustomItemTestCell.nib))
                    // expect(tableView.registerNibInvokeIdentifier.count).to(equal(1))
                    // expect(tableView.registerNibInvokeIdentifier[0]).to(equal(item.className))
                    //
                    // expect(cell is ActionSheetCustomItemTestCell).to(beTrue())
                    // expect(actionCell).to(be(cell))
                }
            }
        }
    }
}

private class TestType: ActionSheetItemCell, CustomItemType {
    
    static let defaultSize = CGSize(width: 100, height: 400)
}
