//
//  ActionSheetBackgroundViewTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-14.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetBackgroundViewTests: QuickSpec {
    
    override func spec() {
        
        describe("setting up in action sheet") {
            
            it("sets up view correctly") {
                let sheet = ActionSheet(menu: .empty) { (_, _) in }
                let view = ActionSheetBackgroundView()
                view.setup(in: sheet)
                expect(view.clipsToBounds).to(beTrue())
                expect(sheet.view.subviews.contains(view)).to(beTrue())
                expect(view.translatesAutoresizingMaskIntoConstraints).to(beFalse())
            }
        }
    }
}
