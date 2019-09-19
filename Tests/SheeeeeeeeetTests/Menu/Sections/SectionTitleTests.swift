//
//  SectionTitleTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class SectionTitleTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = SectionTitle(title: "title", subtitle: "subtitle")
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("action sheet conversion") {
            
            it("can be converted to an action sheet item") {
                let source = SectionTitle(title: "title", subtitle: "subtitle")
                let item = source.toActionSheetItem() as? ActionSheetSectionTitle
                
                expect(item?.title).to(equal("title"))
                expect(item?.subtitle).to(equal("subtitle"))
                expect(item?.value).to(beNil())
                expect(item?.image).to(beNil())
                expect(item?.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
    }
}
