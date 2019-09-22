//
//  ActionSheetHeaderContainerViewTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-15.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet

class ActionSheetHeaderContainerViewTests: QuickSpec {
    
    override func spec() {
        
        describe("setting up in action sheet") {
            
            it("sets up view and action sheet") {
                let view = ActionSheetHeaderContainerView()
                let sheet = ActionSheet(menu: .empty) { _, _ in }
                view.setup(in: sheet)
                expect(view.clipsToBounds).to(beTrue())
                expect(sheet.headerViewContainerHeight.constant).to(equal(150))
                expect(sheet.headerViewContainerHeight.isActive).to(beTrue())
                expect(sheet.stackView.arrangedSubviews.contains(view)).to(beTrue())
            }
        }
        
        describe("laying out subviews") {
            
            it("applies corner radius") {
                let view = ActionSheetHeaderContainerView()
                view.cornerRadius = 123
                view.layoutSubviews()
                expect(view.layer.cornerRadius).to(equal(123))
            }
        }
    }
}
