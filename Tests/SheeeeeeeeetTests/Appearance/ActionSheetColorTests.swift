//
//  ActionSheetColorTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble
import UIKit

class ActionSheetColorTests: QuickSpec {

    override func spec() {
        
        describe("action sheet color") {
            
            func assert(_ color: ActionSheetColor, is expected: UIColor) {
                expect(color.color).to(equal(expected))
            }
            
            it("has correct adaptive color") {
                if #available(iOS 13.0, *) {
                    assert(.actionText, is: .systemBlue)
                    assert(.background, is: .secondarySystemBackground)
                    assert(.danger, is: .systemRed)
                    assert(.disabledText, is: .secondaryLabel)
                    assert(.discreteText, is: .secondaryLabel)
                    assert(.overlay, is: UIColor.black.withAlphaComponent(0.6))
                    assert(.separator, is: .separator)
                    assert(.text, is: .label)
                    assert(.tint, is: .label)
                } else {
                    assert(.actionText, is: .blue)
                    assert(.background, is: .white)
                    assert(.danger, is: .red)
                    assert(.disabledText, is: .lightGray)
                    assert(.discreteText, is: .lightGray)
                    assert(.overlay, is: UIColor.black.withAlphaComponent(0.6))
                    assert(.separator, is: .lightGray)
                    assert(.text, is: .darkText)
                    assert(.tint, is: .darkText)
                }
            }
        }
    }
}
