//
//  StandardFoodMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

class StandardFoodMenu: FoodMenu {

    init(food: [FoodOption]) {
        var items = food.map { $0.toMenuItem() }
        items.insert(MenuTitle(title: FoodMenu.title), at: 0)
        items.append(FoodMenu.cancelButton)
        super.init(items: items)
    }
}
