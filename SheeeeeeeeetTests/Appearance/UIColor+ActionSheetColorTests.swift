//
//  UIColor+ActionSheetColorTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble

class UIColor_ActionSheetColorTests: QuickSpec {
    
    override func spec() {
        
        describe("UI color") {
            
            func compare(_ color: ActionSheetColor, expected: UIColor) {
                expect(color.color).to(equal(expected))
            }
            
            it("can resolve action sheet color") {
                ActionSheetColor.allCases.forEach {
                    expect(UIColor.color(for: $0)).to(equal($0.color))
                }
            }
        }
    }
}
