//
//  ToggleActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

class ToggleActionSheet: ActionSheet {
    
    init(options: [FoodOption], preselected: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        let items = ToggleActionSheet.items(for: options, preselected: preselected)
        super.init(items: items) { sheet, item in
            guard item is ActionSheetOkButton else { return }
            let toggleItems = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
            action(toggleItems.filter { $0.isToggled })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

fileprivate extension ToggleActionSheet {
    
    static func items(for options: [FoodOption], preselected: [FoodOption]) -> [ActionSheetItem] {
        var items = options.map { $0.toggleItem(isToggled: preselected.contains($0)) }
        items.insert(createTitleItem(title: standardTitle), at: 0)
        items.append(createOkButton())
        items.append(createCancelButton())
        return items
    }
}
