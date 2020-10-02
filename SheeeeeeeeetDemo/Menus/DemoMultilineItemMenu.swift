//
//  DemoMultilineItemMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2020-10-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates `DemoMultilineItem`s for the food options,
 then appends a cancel button at the end of the list.
*/
class DemoMultilineItemMenu: FoodMenu {

    init(food: [FoodOption]) {
        var items: [MenuItem] = food.map { $0.toDemoMultilineItem() }
        items.append(FoodMenu.cancelButton)
        super.init(items: items)
    }
}
