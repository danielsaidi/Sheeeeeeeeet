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
            
            it("sets up title and items") {
                let item1 = MenuItem(title: "")
                let item2 = MenuItem(title: "")
                let menu = Menu(title: "title", items: [item1, item2])
                
                expect(menu.title).to(equal("title"))
                expect(menu.items[0]).to(be(item1))
                expect(menu.items[1]).to(be(item2))
            }
            
            it("uses standard configuration by default") {
                let menu = Menu(items: [])
                
                expect(menu.configuration.isDismissable).to(beTrue())
            }
            
            it("can use custom configuration") {
                let menu = Menu(items: [], configuration: .nonDismissable)
                
                expect(menu.configuration.isDismissable).to(beFalse())
            }
        }
    }
}
