//
//  ActionSheetMarginTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetItem_ConversionTests: QuickSpec {
    
    override func spec() {
        
        describe("converting menu item to action sheet item") {
            
            func sheetItem(from item: MenuItem) -> ActionSheetItem {
                ActionSheetItem.from(item)
            }
        }
    }
}
