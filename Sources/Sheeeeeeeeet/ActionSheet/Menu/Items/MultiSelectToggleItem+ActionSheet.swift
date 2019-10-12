//
//  MultiSelectToggleItem+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension MultiSelectToggleItem {

    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetMultiSelectToggleItemCell(style: actionSheetCellStyle)
    }
    
    open override var actionSheetCellStyle: UITableViewCell.CellStyle {
        .value1
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetMultiSelectToggleItemCell.self
    }
}
