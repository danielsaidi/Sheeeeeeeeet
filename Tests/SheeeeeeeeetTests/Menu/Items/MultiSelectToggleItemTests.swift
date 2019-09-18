//
//  MultiSelectToggleItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class MultiSelectToggleItemTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu item") {
            
            it("sets up provided properties") {
                let item = MultiSelectToggleItem(
                    title: "title",
                    state: .selectAll,
                    group: "group",
                    selectAllTitle: "select all",
                    deselectAllTitle: "deselect all"
                )
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.value).to(beNil())
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(MenuItem.TapBehavior.none))
                
                expect(item.state).to(equal(.selectAll))
                expect(item.group).to(equal("group"))
                expect(item.selectAllTitle).to(equal("select all"))
                expect(item.deselectAllTitle).to(equal("deselect all"))
            }
        }
    }
}
