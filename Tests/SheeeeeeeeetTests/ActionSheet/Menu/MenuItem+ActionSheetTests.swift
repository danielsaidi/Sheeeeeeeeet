//
//  MenuItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class MenuItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is not nil") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell).toNot(beNil())
                expect(item.actionSheetCellType).toNot(beNil())
            }
        }
        
        describe("action sheet cell height") {
            
            it("resolves value from superclass if needed") {
                let parent = Parent(title: "")
                let child = Child(title: "")
                ActionSheetItemCell.appearance().height = 1
                expect(parent.actionSheetCellHeight).to(equal(1))
                expect(child.actionSheetCellHeight).to(equal(1))
                ParentCell.appearance().height = 50
                expect(parent.actionSheetCellHeight).to(equal(50))
                expect(child.actionSheetCellHeight).to(equal(50))
            }
        }
        
        describe("preferred action sheet cell style") {
            
            it("is subtitle if item has subtitle") {
                let item = MenuItem(title: "title", subtitle: "subtitle")
                expect(item.actionSheetCellStyle).to(equal(.subtitle))
            }
            
            it("is default if item has no subtitle") {
                let item = MenuItem(title: "title")
                expect(item.actionSheetCellStyle).to(equal(.default))
            }
        }
    }
}

private class Parent: MenuItem {
    
    override var actionSheetCellType: ActionSheetItemCell.Type { ParentCell.self }
}

private class Child: Parent {
    
    override var actionSheetCellType: ActionSheetItemCell.Type { ChildCell.self }
}

private class ParentCell: ActionSheetItemCell {}
private class ChildCell: ParentCell {}
