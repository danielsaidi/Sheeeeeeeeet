//
//  MenuTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class MenuTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu") {
            
            it("sets up menu items") {
                let item1 = MenuItem(title: "")
                let item2 = MenuItem(title: "")
                let items = [item1, item2]
                let menu = Menu(items: items)
                
                expect(menu.items[0]).to(be(item1))
                expect(menu.items[1]).to(be(item2))
            }
        }
    }
}
