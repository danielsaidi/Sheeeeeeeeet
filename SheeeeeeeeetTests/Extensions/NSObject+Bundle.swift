//
//  NSObject+Bundle.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-12-25.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet

class NSObject_BundleTests: QuickSpec {
    
    override func spec() {
        
        describe("bundle") {
            
            it("is valid for base type") {
                let expected = Bundle(for: ActionSheet.self)
                expect(ActionSheet.bundle.bundlePath).to(equal(expected.bundlePath))
            }
            
            it("is valid for inherited type") {
                let sheetBundle = Bundle(for: ActionSheet.self)
                expect(TestSheet.bundle.bundlePath).toNot(equal(sheetBundle.bundlePath))
            }
            
            it("is valid for base type instance") {
                let obj = ActionSheet(items: []) { _, _ in }
                let expected = Bundle(for: ActionSheet.self)
                expect(obj.bundle.bundlePath).to(equal(expected.bundlePath))
            }
            
            it("is valid for inherited type instance") {
                let obj = TestSheet(items: []) { _, _ in }
                let sheetBundle = Bundle(for: ActionSheet.self)
                expect(obj.bundle.bundlePath).toNot(equal(sheetBundle.bundlePath))
            }
        }
    }
}

private class TestSheet: ActionSheet {}
