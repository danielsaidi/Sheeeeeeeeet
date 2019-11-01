//
//  SingleSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A `SingleSelectItem` can be used when a user should be able
 to select a single item within a menu or menu group.
 
 This item automatically deselects other single-select items
 in the same group when it's tapped. You can use many groups
 within a menu.
 
 A single select item will by default dismiss the sheet when
 it's tapped. To change this, set `tapBehavior` to `.none`.
 */
open class SingleSelectItem: SelectItem {
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }

    open override func handleSelection(in menu: Menu) {
        super.handleSelection(in: menu)
        let items = menu.items.compactMap { $0 as? SingleSelectItem }
        let groupItems = items.filter { $0.group == group }
        groupItems.forEach { $0.isSelected = false }
        isSelected = true
    }
}
