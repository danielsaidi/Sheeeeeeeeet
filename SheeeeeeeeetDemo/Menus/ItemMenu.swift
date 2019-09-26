//
//  ItemMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates `MenuItem`s for the provided food options,
 then appends a cancel button at the end of the list.
*/
class ItemMenu: FoodMenu {

    init(food: [FoodOption], configuration: Configuration = .standard) {
        var items = food.map { $0.toMenuItem() }
        items.append(DestructiveButton(title: "Remove"))
        items.append(FoodMenu.cancelButton)
        super.init(items: items, configuration: configuration)
    }
}
