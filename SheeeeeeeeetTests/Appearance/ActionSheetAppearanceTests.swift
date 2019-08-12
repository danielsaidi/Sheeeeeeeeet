//
//  ActionSheetAppearanceTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble

class ActionSheetAppearanceTests: QuickSpec {

    override func spec() {
        
        describe("standard appearance") {
            
            it("is of correct type") {
                let appearance = ActionSheetAppearance.standard
                let standard = appearance as? StandardActionSheetAppearance
                expect(standard).toNot(beNil())
            }
        }
    }
}
