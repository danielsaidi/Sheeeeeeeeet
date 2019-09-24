//
//  CustomItem+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension CustomItem {

    /**
     When resolving an action sheet cell for this item type,
     `CustomItemType` must inherit `ActionSheetItemCell` and
     have a .xib file with the same name as the class in the
     same bundle.
     */
    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        let className = String(describing: itemType)
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
        let dequeued = tableView.dequeueReusableCell(withIdentifier: className)
        guard let cell = dequeued as? ActionSheetItemCell else { fatalError("CustomItem.actionSheetCell(for:) requires that CustomItemType inherits ActionSheetItemCell") }
        guard let item = cell as? CustomItemType else { fatalError("CustomItem.actionSheetCell(for:) requires that the ActionSheetItemCell implements CustomItemType") }
        itemSetupAction(item)
        return cell
    }
    
    open override var actionSheetCellHeight: Double {
        Double(itemType.preferredSize.height)
    }
}
