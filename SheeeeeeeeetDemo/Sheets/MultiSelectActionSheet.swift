//
//  MultiSelectActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

/**
 This action sheet shows you how to create a sheet that uses
 the `ActionSheetMultiSelectItem` item type.
 
 This sheet has two different item sections. Selecting items
 in one section has no effect on the other. This is standard
 behavior for multi-select items with different group names.
 
 This sheet also has two `ActionSheetMultiSelectToggleItem`s,
 which can be used to select and deselect items in a section.
 */
class MultiSelectActionSheet: ActionSheet {
    
    convenience init(options: [FoodOption], preselected: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        self.init(menu: MultiSelectFoodMenu(food: options)) { sheet, item in
            guard item.isOkButton else { return }
            let selectItems = sheet.items.compactMap { $0 as? ActionSheetSelectItem }
            let selectedItems = selectItems.filter { $0.isSelected }
            action(selectedItems)
        }
    }
}
