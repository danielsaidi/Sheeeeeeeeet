//
//  MultiSelectActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

class MultiSelectActionSheet: ActionSheet {
    
    init(options: [FoodOption], preselected: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        let items = MultiSelectActionSheet.items(for: options, preselected: preselected)
        super.init(items: items) { sheet, item in
            
            if item is ActionSheetTitle {
                
                var selectAction: Bool

                let selectItems = sheet.items.flatMap { $0 as? ActionSheetSelectItem }
                if (selectItems.filter { $0.isSelected }).count > 0 {
                    selectAction = false
                    item.subtitle = "Select all"
                } else {
                    selectAction = true
                    item.subtitle = "Deselect all"
                }

                for itemToUpdate in sheet.items {
                    (itemToUpdate as? ActionSheetSelectItem)?.isSelected = selectAction
                }
            }
            
            guard item is ActionSheetOkButton else { return }
            let selectItems = sheet.items.flatMap { $0 as? ActionSheetSelectItem }
            action(selectItems.filter { $0.isSelected })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

fileprivate extension MultiSelectActionSheet {
    
    static func items(for options: [FoodOption], preselected: [FoodOption]) -> [ActionSheetItem] {
        var items = options.map { $0.selectItem(isSelected: preselected.contains($0)) }
        items.insert(createTitleItem(title: standardTitle, subtitle: preselected.count > 0 ? "Deselect all" : "Select all"), at: 0)
        items.append(createOkButton())
        items.append(createCancelButton())
        return items
    }
}
