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
        }
        
        describe("applying an appearance") {
            
            it("applies provided appearance") {
                ActionSheet.applyAppearance(appearance)
                let exec = appearance.recorder.executions(of: appearance.apply)
                expect(exec.count).to(equal(1))
            }
            
            it("applies standard appearance by default") {
                ActionSheet.applyAppearance()
                let cancelButton = ActionSheetCancelButtonCell.appearance()
                expect(cancelButton.titleColor).to(equal(.color(for: .discreteText)))
            }
        }
    }
}
