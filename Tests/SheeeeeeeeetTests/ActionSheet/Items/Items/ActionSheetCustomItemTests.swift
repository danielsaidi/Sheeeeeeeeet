//
//  ActionSheetCustomItemTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-03-14.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetCustomItemTests: QuickSpec {
    
    override func spec() {
        
        describe("created instance") {
            
            it("is correctly setup") {
                let type = ActionSheetCustomItemTestCell.self
                let item = ActionSheetCustomItem(cellType: type, setupAction: { _ in })
                expect(item.cellType).to(be(type))
                expect(item.setupAction).toNot(beNil())
                expect(item.title).to(equal(""))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(ActionSheetItem.TapBehavior.none))
            }
        }
        
        describe("height") {
            
            it("is cell types default height") {
                let type = ActionSheetCustomItemTestCell.self
                let item = ActionSheetCustomItem(cellType: type, setupAction: { _ in })
                expect(item.height).to(equal(ActionSheetCustomItemTestCell.defaultSize.height))
            }
        }
        
        describe("cell for table view") {
            
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


private class MockTableView: UITableView {
    
    var registerNibInvokeCount = 0
    var registerNibInvokeNibs = [UINib?]()
    var registerNibInvokeIdentifier = [String]()
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        super.register(nib, forCellReuseIdentifier: identifier)
        registerNibInvokeCount += 1
        registerNibInvokeNibs.append(nib)
        registerNibInvokeIdentifier.append(identifier)
    }
}
