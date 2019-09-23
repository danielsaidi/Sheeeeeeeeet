//
//  CancelButtonTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class CancelButtonTests: QuickSpec {
    
    override func spec() {
        
        describe("creating cancel button") {
            
            it("sets up provided properties") {
                let item = CancelButton(title: "title")
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.value as? MenuButton.ButtonType).to(equal(.cancel))
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(.dismiss))
            }
        }
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = CancelButton(title: "title")
                let cell = item.cell(for: UITableView())
                expect(cell is ActionSheetCancelButtonCell).to(beTrue())
                expect(item.cellType is ActionSheetCancelButtonCell.Type).to(beTrue())
            }
        }
    }
}
