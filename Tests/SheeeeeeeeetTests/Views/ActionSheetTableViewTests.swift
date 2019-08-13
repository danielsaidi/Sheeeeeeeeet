//
//  ActionSheetTableViewTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-15.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetTableViewTests: QuickSpec {
    
    override func spec() {
        
        describe("laying out subviews") {
            
            it("works correctly") {
                let view = ActionSheetTableView(frame: .zero)
                view.cornerRadius = 123
                view.layoutSubviews()
                expect(view.layer.cornerRadius).to(equal(123))
            }
        }
    }
}
