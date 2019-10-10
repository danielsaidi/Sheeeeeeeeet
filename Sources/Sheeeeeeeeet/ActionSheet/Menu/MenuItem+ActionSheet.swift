//
//  MenuItem+ActionSheetItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension MenuItem {
    
    @objc open func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetItemCell(style: preferredActionSheetCellStyle)
    }
    
    @objc open var actionSheetCellHeight: Double {
        actionSheetCellType.appearance().height
    }
    
    @objc open var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetItemCell.self
    }
    
    @objc open var preferredActionSheetCellStyle: UITableViewCell.CellStyle {
        let hasSubtitle = subtitle != nil
        return hasSubtitle ? .subtitle : .default
    }
}
