//
//  DestructiveActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/*
 
 These extensions provides action sheets with functions that
 are shared by all example action sheets.
 
 */

import Sheeeeeeeeet

class DestructiveActionSheet: ActionSheet {
    
    init(options: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        let items = DestructiveActionSheet.items(for: options)
        super.init(items: items) { sheet, item in
            guard item is ActionSheetDangerButton else { return }
            let items = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
            action(items.filter { $0.isToggled })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

fileprivate extension DestructiveActionSheet {
    
    static func items(for options: [FoodOption]) -> [ActionSheetItem] {
        let titleItem = ActionSheetTitle(title: "Remove Payment Options")
        let image = UIImage(named: "ic_credit_card")
        let visaTitle = "Visa **** **** **** 4321"
        let visa = ActionSheetToggleItem(title: visaTitle, isToggled: false, value: "visa", image: image)
        let masterTitle = "MasterCard **** **** **** 9876"
        let master = ActionSheetToggleItem(title: masterTitle, isToggled: false, value: "master", image: image)
        let removeButton = ActionSheetDangerButton(title: "Remove")
        return [titleItem, visa, master, createCancelButton(), removeButton]
    }
}
