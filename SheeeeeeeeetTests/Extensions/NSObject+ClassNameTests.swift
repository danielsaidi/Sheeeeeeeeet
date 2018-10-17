//
//  NSObject+ClassNameTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet

class NSObject_ClassNameTests: QuickSpec {
    
    override func spec() {
        
        describe("class name") {
            
            it("is a valid string representation of the type name") {
                expect(ActionSheet.className).to(equal("ActionSheet"))
            }
        }
    }
}
