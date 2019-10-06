//
//  SingleSelectMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates a `SingleSelectItem` for each food option.
 It then creates two sections with these items, then appends
 an ok and a cancel button to the end of the item list.
 
 You can select a single item in each section. Selecting one
 item will deselect all other items in the same section, but
 not affect the other section.
*/
class SingleSelectMenu: FoodMenu {
    
    init(food: [FoodOption]) {
        let items = SingleSelectMenu.items(for: food)
        super.init(items: items)
    }
}

private extension SingleSelectMenu {
    
    static func items(for food: [FoodOption]) -> [MenuItem] {
        var items = [MenuItem]()
        items.append(contentsOf: itemsGroup(for: food, preselected: .fast, group: "Appetizer"))
        items.append(SectionMargin())
        items.append(contentsOf: itemsGroup(for: food, preselected: .fancy, group: "Main Dish"))
        items.append(okButton)
        items.append(cancelButton)
        return items
    }
    
    static func itemsGroup(for food: [FoodOption], preselected: FoodOption?, group: String) -> [MenuItem] {
        let food = food.filter { $0 != .none && $0 != .homeMade }
        let items = food.map { $0.toSingleSelectItem(isSelected: $0 == preselected, group: group) }
        let title = SectionTitle(title: group)
        return CollectionOfOne(title) + items
    }
}
