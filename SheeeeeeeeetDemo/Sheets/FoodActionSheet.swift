//
//  StandardActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

/**
 This action sheet lists food and either alerts all selected
 select items or a single item if one is tapped.
 */
class FoodActionSheet: ActionSheet {
    
    convenience init(menu: FoodMenu, action: @escaping ([ActionSheetItem]) -> ()) {
        self.init(menu: menu) { sheet, item in
            if item.isCancelButton { return }
            if sheet.shouldAlert(item) { return action([item]) }
            guard item.isOkButton else { return }
            let selected = sheet.getSelectedItems()
            guard selected.count > 0 else { return }
            action(selected)
        }
    }
}

private extension ActionSheet {
    
    func getSelectedItems() -> [ActionSheetItem] {
        let items = self.items.compactMap { $0 as? ActionSheetSelectItem }
        let selectedItems = items.filter { $0.isSelected }
        return selectedItems
    }
    
    func shouldAlert(_ item: ActionSheetItem) -> Bool {
        item.tapBehavior == .dismiss && !item.isOkButton
    }
}
