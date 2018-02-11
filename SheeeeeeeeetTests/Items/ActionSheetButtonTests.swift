//
//  ActionSheetButtonTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetButtonTests: QuickSpec {
    
    override func spec() {
        
        describe("tap behavior") {
            
            it("is dismiss") {
                let item = ActionSheetButton(title: "foo", value: true)
                expect(item.tapBehavior).to(equal(ActionSheetItemTapBehavior.dismiss))
            }
        }
    }
}
