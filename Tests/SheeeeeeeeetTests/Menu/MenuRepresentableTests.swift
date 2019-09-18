//
//  MenuRepresentableTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-18.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class MenuRepresentableTests: QuickSpec {
    
    override func spec() {
        
        var menu: TestClass!
        
        beforeEach {
            menu = TestClass()
        }
        
        describe("finding items of certain type") {
            
            it("returns empty array for empty collection") {
                let result = menu.items(ofType: TestItem.self)
                expect(result.count).to(equal(0))
            }
            
            it("returns empty array for collection without any matches") {
                menu.items = [TestItem(), TestItem()]
                let result = menu.items(ofType: TestItem1.self)
                expect(result.count).to(equal(0))
            }
            
            it("returns matching types from collection") {
                menu.items = [TestItem2(), TestItem1(), TestItem2()]
                let result = menu.items(ofType: TestItem2.self)
                expect(result.count).to(equal(2))
            }
            
            it("honors inheritance") {
                menu.items = [TestItem2(), TestItem1(), TestItem2()]
                let result = menu.items(ofType: TestItem1.self)
                expect(result.count).to(equal(3))
            }
        }
    }
}

private class TestClass: MenuRepresentable {
    
    typealias ItemType = TestItem
    
    var items = [ItemType]()
}

private class TestItem: MenuItemRepresentable {}
private class TestItem1: TestItem {}
private class TestItem2: TestItem1 {}
