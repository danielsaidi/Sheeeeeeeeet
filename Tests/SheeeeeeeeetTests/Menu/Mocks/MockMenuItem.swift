//
//  MockMenuItem.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

class MockMenuItem: MenuItem {
    
    var handleTapInvokeCount = 0
    var handleTapInvokeMenus = [Menu]()
    
    var cell: ActionSheetItemCell?
    
    override func handleSelection(in menu: Menu) {
        super.handleSelection(in: menu)
        handleTapInvokeCount += 1
        handleTapInvokeMenus.append(menu)
    }
    
    override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        cell ?? super.actionSheetCell(for: tableView)
    }
}
