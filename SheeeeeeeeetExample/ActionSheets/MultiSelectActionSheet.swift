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
        items.insert(createTitleItem(title: standardTitle), at: 0)
        items.append(createOkButton())
        items.append(createCancelButton())
        return items
    }
}
