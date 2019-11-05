//
//  SecondaryActionItem+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-11-01.
//

import UIKit

extension SecondaryActionItem {

    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        let cell = ActionSheetSecondaryActionItemCell(style: actionSheetCellStyle)
        cell.tapAction = { [weak self] _ in
            guard let self = self else { return }
            self.secondaryAction(self)
        }
        return cell
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetSecondaryActionItemCell.self
    }
}
