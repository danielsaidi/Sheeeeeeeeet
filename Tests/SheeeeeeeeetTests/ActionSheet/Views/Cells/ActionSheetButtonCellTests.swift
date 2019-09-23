//
//  ActionSheetButtonTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class ActionSheetButtonCellTests: QuickSpec {
    
    override func spec() {
        
        describe("refreshing") {
            
            it("center aligns text label") {
                let item = MenuButton(title: "foo", type: .ok)
                let cell = item.actionSheetCell(for: UITableView())
                cell.refresh()
                expect(cell.textLabel?.textAlignment).to(equal(.center))
            }
        }
    }
}
