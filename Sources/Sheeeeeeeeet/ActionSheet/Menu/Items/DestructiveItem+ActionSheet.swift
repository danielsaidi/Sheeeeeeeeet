//
//  DestructiveItem+ActionSheet.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-12-09.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension DestructiveItem {

    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetDestructiveItemCell(style: actionSheetCellStyle)
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetDestructiveItemCell.self
    }
}
