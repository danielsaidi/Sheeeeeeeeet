//
//  ActionSheet_ConfigurationTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheet_ConfigurationTests: QuickSpec {
    
    override func spec() {
        
        describe("standard configuration") {
            
            it("is correctly configured") {
                let config = ActionSheet.Configuration.standard
                expect(config.isDismissable).to(beTrue())
                expect(config.shouldBeDismissedWhenEnteringBackground).to(beFalse())
            }
        }
        
        describe("dismissable configuration") {
            
            it("is correctly configured") {
                let config = ActionSheet.Configuration.nonDismissable
                expect(config.isDismissable).to(beFalse())
                expect(config.shouldBeDismissedWhenEnteringBackground).to(beFalse())
            }
        }
    }
}
