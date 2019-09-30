//
//  CollectionItem+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension CollectionItem {

    /**
     When resolving an action sheet cell for this item type,
     `CollectionItemType` must inherit `UICollectionViewCell`
     and have a `.xib` file with the same name as the item's
     class name placed in the same bundle as the class.
     */
    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        let className = String(describing: type(of: self))
        let itemClassName = String(describing: itemType)
        tableView.register(ActionSheetCollectionItemCell.self, forCellReuseIdentifier: className)
        let cell = tableView.dequeueReusableCell(withIdentifier: className)
        guard let typedCell = cell as? ActionSheetCollectionItemCell else { fatalError("CollectionItem.actionSheetCell(for:) has failed to register ActionSheetCollectionItemCell with the target table view.") }
        let nib = UINib(nibName: itemClassName, bundle: nil)
        let handler = ActionSheetCollectionItemCellHandler(item: self, tableView: tableView)
        typedCell.setup(withNib: nib, handler: handler)
        return typedCell
    }
    
    open override var actionSheetCellHeight: Double {
        Double(itemType.preferredSize.height)
    }
}
