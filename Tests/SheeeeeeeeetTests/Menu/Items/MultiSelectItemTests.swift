//
//  MultiSelectItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class MultiSelectItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("fills in omitted properties") {
                let item = MultiSelectItem(title: "title", isSelected: true)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.isSelected).to(beTrue())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
            
            it("sets up provided properties") {
                let image = UIImage()
                let item = MultiSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: image)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(equal("subtitle"))
                expect(item.isSelected).to(beTrue())
                expect(item.value as? Bool).to(beTrue())
                expect(item.image).to(be(image))
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
        
        describe("action sheet conversion") {
            
            it("can be converted to an action sheet item") {
                let image = UIImage()
                let source = MultiSelectItem(title: "title", subtitle: "subtitle", isSelected: true, value: true, image: image)
                let item = source.toActionSheetItem() as? ActionSheetMultiSelectItem
                
                expect(item?.title).to(equal("title"))
                expect(item?.subtitle).to(equal("subtitle"))
                expect(item?.isSelected).to(beTrue())
                expect(item?.value as? Bool).to(beTrue())
                expect(item?.image).to(be(image))
                expect(item?.tapBehavior).to(equal(MenuItem.TapBehavior.none))
            }
        }
    }
}
