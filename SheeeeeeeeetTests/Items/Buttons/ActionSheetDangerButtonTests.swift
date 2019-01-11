//
//  ActionSheetDangerButtonTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetDangerButtonTests: ActionSheetItemTests {
    
    override func spec() {
        
        let item = ActionSheetDangerButton(title: "foo")
        
        describe("when created") {
            
            it("applies provided values") {
                expect(item.title).to(equal("foo"))
            }
            
            it("is correctly setup") {
                expect(item.value as? ActionSheetButton.ButtonType).to(equal(.ok))
                expect(item.isOkButton).to(beTrue())
            }
        }
    }
}
