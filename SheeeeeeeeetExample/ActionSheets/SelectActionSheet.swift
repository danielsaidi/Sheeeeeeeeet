//
//  SelectActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2018-04-01.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

class SelectActionSheet: ActionSheet {
    
    init(options: [FoodOption], preselected: FoodOption, action: @escaping (ActionSheetItem) -> ()) {
        let items = SelectActionSheet.items(for: options, preselected: preselected)
        super.init(items: items) { _, item in
            action(item)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

fileprivate extension SelectActionSheet {
    
    static func items(for options: [FoodOption], preselected: FoodOption) -> [ActionSheetItem] {
        var items = options.map { $0.selectItem(isSelected: preselected.displayName == $0.displayName) }
        items.insert(createTitleItem(title: standardTitle), at: 0)
        return items
    }
}
