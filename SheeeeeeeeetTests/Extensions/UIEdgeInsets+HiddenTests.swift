//
//  UIEdgeInsets+HiddenTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-15.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class UIEdgeInsets_HiddenTests: QuickSpec {
    
    override func spec() {
        
        describe("hidden separator") {
            
            it("has correct insets") {
                let value = UIEdgeInsets.hiddenSeparator
                let expected = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100_000)
                
                expect(value).to(equal(expected))
            }
        }
    }
}
