//
//  DestructiveMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

/**
 This menu creates a `MultiSelectItem` for every food option
 and appends a destructive button a cancel button to the end.
*/
class DestructiveMenu: FoodMenu {

    init() {
        let image = UIImage(named: "ic_credit_card")
        let visaTitle = "Visa **** **** **** 4321"
        let visaSubtitle = "Secondary Card"
        let visa = MultiSelectItem(title: visaTitle, subtitle: visaSubtitle, isSelected: false, value: "visa", image: image)
        let masterTitle = "MasterCard **** **** **** 9876"
        let masterSubtitle = "Secondary Card"
        let master = MultiSelectItem(title: masterTitle, subtitle: masterSubtitle, isSelected: false, value: "master", image: image)
        let removeButton = DestructiveButton(title: "Remove")
        let items = [visa, master, removeButton, FoodMenu.cancelButton]
        super.init(title: "Remove Payment Options", items: items)
    }
}
