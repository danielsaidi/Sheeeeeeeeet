//
//  SectionTitle+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension SectionTitle {

    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetSectionTitleCell(style: actionSheetCellStyle)
    }
    
    open override var actionSheetCellStyle: UITableViewCell.CellStyle {
        .value1
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetSectionTitleCell.self
    }
}
