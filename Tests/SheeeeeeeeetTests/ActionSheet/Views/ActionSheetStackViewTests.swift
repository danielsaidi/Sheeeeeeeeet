//
//  ActionSheetStackViewTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-15.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetStackViewTests: QuickSpec {
    
    override func spec() {
        
        describe("setting up in action sheet") {
            
            var view: ActionSheetStackView!
            var sheet: ActionSheet!
            
            beforeEach {
                view = ActionSheetStackView()
                sheet = ActionSheet { _, _ in }
                view.setup(in: sheet)
            }
            
            it("sets up view") {
                expect(view.axis).to(equal(.vertical))
                expect(view.alignment).to(equal(.fill))
                expect(view.distribution).to(equal(.fill))
                expect(view.translatesAutoresizingMaskIntoConstraints).to(beFalse())
            }
            
            it("adds view as sheet subview") {
                expect(sheet.view.subviews.contains(view)).to(beTrue())
            }
            
            it("configures sheet margins") {
                expect(sheet.topMargin.constant).to(equal(0))
                expect(sheet.topMargin.priority).to(equal(UILayoutPriority(1000)))
                expect(sheet.leftMargin.constant).to(equal(0))
                expect(sheet.leftMargin.priority).to(equal(UILayoutPriority(1000)))
                expect(sheet.rightMargin.constant).to(equal(0))
                expect(sheet.rightMargin.priority).to(equal(UILayoutPriority(1000)))
                expect(sheet.bottomMargin.constant).to(equal(0))
                expect(sheet.bottomMargin.priority).to(equal(UILayoutPriority(1000)))
            }
        }
    }
}
