//
//  ContextMenu_ConfigurationTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ContextMenu_ConfigurationTests: QuickSpec {
    
    override func spec() {
        
        describe("standard configuration") {
            
            it("is correctly configured") {
                let config = ContextMenu.Configuration.standard
                expect(config.shouldBeDismissedWhenEnteringBackground).to(beFalse())
            }
        }
        
        describe("background dismissable configuration") {
            
            it("is correctly configured") {
                let config = ContextMenu.Configuration.backgroundDismissable
                expect(config.shouldBeDismissedWhenEnteringBackground).to(beTrue())
            }
        }
    }
}
