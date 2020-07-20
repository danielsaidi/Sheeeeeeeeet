//
//  ActionSheet+AppearanceTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble

class ActionSheet_AppearanceTests: QuickSpec {
    
    override func spec() {
        
        var appearance: MockActionSheetAppearance!
        
        beforeEach {
            appearance = MockActionSheetAppearance()
            ActionSheetAppearance.global = nil
        }
        
        describe("applying an appearance") {
            
            it("applies provided appearance") {
                ActionSheet.applyAppearance(appearance)
                let exec = appearance.invokations(of: appearance.applyRef)
                expect(exec.count).to(equal(1))
                expect(ActionSheetAppearance.global).to(be(appearance))
            }
            
            it("overwrites previous appearance") {
                let appearance1 = MockActionSheetAppearance()
                let appearance2 = MockActionSheetAppearance()
                ActionSheet.applyAppearance(appearance1)
                ActionSheet.applyAppearance(appearance2)
                let exec1 = appearance1.invokations(of: appearance1.applyRef)
                let exec2 = appearance2.invokations(of: appearance2.applyRef)
                expect(exec1.count).to(equal(1))
                expect(exec2.count).to(equal(1))
                expect(ActionSheetAppearance.global).to(be(appearance2))
            }
            
            it("does not overwrite previous appearance if force is false") {
                let appearance1 = MockActionSheetAppearance()
                let appearance2 = MockActionSheetAppearance()
                ActionSheet.applyAppearance(appearance1)
                ActionSheet.applyAppearance(appearance2, force: false)
                let exec1 = appearance1.invokations(of: appearance1.applyRef)
                let exec2 = appearance2.invokations(of: appearance2.applyRef)
                expect(exec1.count).to(equal(1))
                expect(exec2.count).to(equal(0))
                expect(ActionSheetAppearance.global).to(be(appearance1))
            }
            
            it("applies standard appearance by default") {
                ActionSheet.applyAppearance()
                let cancel = ActionSheetCancelButtonCell.appearance()
                expect(cancel.titleColor).to(equal(.sheetColor(.discreteText)))
            }
        }
    }
}
