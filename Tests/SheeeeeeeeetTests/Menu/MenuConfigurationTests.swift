//
//  MenuConfigurationTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class MenuConfigurationTests: QuickSpec {
    
    override func spec() {
        
        describe("standard configuration") {
            
            it("can be dismissed") {
                let config = Menu.Configuration.standard
                expect(config.isDismissable).to(beTrue())
            }
        }
        
        describe("dismissable configuration") {
            
            it("can be dismissed") {
                let config = Menu.Configuration.nonDismissable
                expect(config.isDismissable).to(beFalse())
            }
        }
    }
}
