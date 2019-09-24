//
//  MenuItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
import Sheeeeeeeeet

class MenuItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = MenuItem(title: "title")
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(.dismiss))
            }
            
            it("sets up provided properties") {
                let image = UIImage()
                let item = MenuItem(
                    title: "title",
                    subtitle: "subtitle",
                    value: true,
                    image: image,
                    tapBehavior: .none)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.value as? Bool).to(beTrue())
                expect(item.image).to(be(image))
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
    }
}
