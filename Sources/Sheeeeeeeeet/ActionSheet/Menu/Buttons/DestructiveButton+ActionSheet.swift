//
//  DestructiveButton+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension DestructiveButton {

    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetDestructiveButtonCell(style: actionSheetCellStyle)
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetDestructiveButtonCell.self
    }
}
