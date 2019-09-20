//
//  SectionItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SectionItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating section item") {
            
            it("configures itself to be non-tappable") {
                let item = SectionItem(title: "title", subtitle: "subtitle")
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
    }
}
