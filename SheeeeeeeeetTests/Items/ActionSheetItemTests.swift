//
//  ActionSheetItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetItemTests: QuickSpec {
    
    override func spec() {
        
        let item = ActionSheetItem(title: "foo", value: true, image: UIImage())
        
        describe("when created") {
            
            it("applies provided values") {
                expect(item.title).to(equal("foo"))
                expect(item.value as? Bool).to(equal(true))
                expect(item.image).toNot(beNil())
            }
        }
        
        describe("cell style") {
            
            it("is default") {
                expect(item.cellStyle).to(equal(UITableViewCellStyle.default))
            }
        }
        
        describe("tap behavior") {
            
            it("is dismiss") {
                expect(item.tapBehavior).to(equal(ActionSheetItem.TapBehavior.dismiss))
            }
        }
    }
}
