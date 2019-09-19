//
//  StandardFoodMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates a standard `MenuItem` for each food, then
 adds a cancel button to the end of the item list.
*/
class StandardFoodMenu: FoodMenu {

    init(food: [FoodOption]) {
        var items = food.map { $0.toMenuItem() }
        items.append(FoodMenu.cancelButton)
        super.init(items: items)
    }
}
