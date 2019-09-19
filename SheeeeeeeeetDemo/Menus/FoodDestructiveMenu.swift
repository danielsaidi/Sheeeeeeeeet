//
//  FoodDestructiveMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates a `MultiSelectItem` for every food option
 and appends a destructive button a cancel button to the end
 of the list.
*/
class FoodDestructiveMenu: FoodMenu {

    init(food: [FoodOption]) {
        let image = UIImage(named: "ic_credit_card")
        let visaTitle = "Visa **** **** **** 4321"
        let visa = MultiSelectItem(title: visaTitle, isSelected: false, value: "visa", image: image)
        let masterTitle = "MasterCard **** **** **** 9876"
        let master = MultiSelectItem(title: masterTitle, isSelected: false, value: "master", image: image)
        let removeButton = DestructiveButton(title: "Remove")
        let items = [visa, master, removeButton, FoodMenu.cancelButton]
        super.init(title: "Remove Payment Options", items: items)
    }
}
