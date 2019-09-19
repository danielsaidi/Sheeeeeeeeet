//
//  StandardActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

/**
 This is a standard food picker action sheet, with only standard action sheet items.
 */
class StandardActionSheet: ActionSheet {
    
    convenience init(options: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        self.init(menu: StandardFoodMenu(food: options)) { _, item in
            if item.value == nil { return }
            action([item])
        }
    }
}
