//
//  MultiSelectMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu creates a `MultiSelectItem` for every food option.
 It then creates two sections with these items, then appends
 an ok and a cancel button to the end of the item list.
 
 You can select one or many items in each section. Selecting
 items in one section doesn't affect the other section.

 This sheet also uses two `MultiSelectToggleItem` items that
 can be used to select and deselect all items in a section.
*/
class MultiSelectMenu: FoodMenu {

    init(food: [FoodOption]) {
        let items = MultiSelectMenu.items(for: food)
        super.init(items: items)
    }
}

private extension MultiSelectMenu {
    
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
        let items = food.map { $0.toMultiSelectItem(isSelected: $0 == preselected, group: group) }
        let toggle = MultiSelectToggleItem(title: group, state: .selectAll, group: group, selectAllTitle: "Select all", deselectAllTitle: "Deselect all")
        return CollectionOfOne(toggle) + items
    }
}
