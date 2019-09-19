//
//  FoodLinkMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates `LinkItem`s for the provided food options,
 then appends a cancel button at the end of the list.
*/
class FoodLinkMenu: FoodMenu {

    init(food: [FoodOption]) {
        var items: [MenuItem] = food.map { $0.toLinkItem() }
        items.append(FoodMenu.cancelButton)
        super.init(items: items)
    }
}
