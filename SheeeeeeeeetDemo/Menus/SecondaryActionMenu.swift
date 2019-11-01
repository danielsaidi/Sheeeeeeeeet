//
//  SecondaryActionMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-11-01.
//

import Sheeeeeeeeet

/**
 This menu creates a `SecondaryActionItem` for each provided
 food option, then appends a cancel button at the end of the
 item list.
 */
class SecondaryActionMenu: FoodMenu {

    init(food: [FoodOption], configuration: Configuration = .standard) {
        var items = food.map { $0.toSecondaryMenuItem() }
        items.append(FoodMenu.cancelButton)
        super.init(items: items, configuration: configuration)
    }
}
