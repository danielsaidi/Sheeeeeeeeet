//
//  FoodOption+ActionSheetItems.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/**
 This file extends the food option enum with item extensions,
 that can be used to create action sheet items for an option.
 */

import Sheeeeeeeeet

extension FoodOption {
    
    func toMenuItem() -> MenuItem {
        MenuItem(
            title: title,
            subtitle: subtitle,
            value: self,
            image: image
        )
    }
    
    func toLinkItem() -> LinkItem {
        LinkItem(
            title: title,
            subtitle: subtitle,
            value: self,
            image: image
        )
    }
    
    func toMultiSelectItem(isSelected: Bool, group: String = "") -> MultiSelectItem {
        MultiSelectItem(
            title: title,
            isSelected: isSelected,
            group: group,
            value: self,
            image: image
        )
    }
    
    func toSecondaryMenuItem() -> MenuItem {
        SecondaryActionItem(
            title: title,
            subtitle: subtitle,
            value: self,
            image: image,
            secondaryAction: { print("Secondary action tapped") }
        )
    }
    
    func toSingleSelectItem(isSelected: Bool, group: String = "") -> SingleSelectItem {
        SingleSelectItem(
            title: title,
            isSelected: isSelected,
            group: group,
            value: self,
            image: image,
            tapBehavior: .none
        )
    }
}
