//
//  MultiSelectFoodMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

class MultiSelectFoodMenu: FoodMenu {

    init(food: [FoodOption]) {
        let items = MultiSelectFoodMenu.items(for: food)
        super.init(items: items)
    }
}

private extension MultiSelectFoodMenu {
    
    static func items(for options: [FoodOption]) -> [MenuItem] {
        var items = [MenuItem]()
        items.append(contentsOf: itemsGroup(for: options, preselected: .fast, group: "Appetizer"))
        items.append(SectionMargin())
        items.append(contentsOf: itemsGroup(for: options, preselected: .fancy, group: "Main Dish"))
        items.append(okButton)
        items.append(cancelButton)
        return items
    }
    
    static func itemsGroup(for options: [FoodOption], preselected: FoodOption?, group: String) -> [MenuItem] {
        var items = [MenuItem]()
        let options = options.filter { $0 != .none && $0 != .homeMade }
        let foodItems = options.map { $0.toMultiSelectItem(isSelected: $0 == preselected, group: group) }
        let toggler = MultiSelectToggleItem(title: group, state: .selectAll, group: group, selectAllTitle: "Select all", deselectAllTitle: "Deselect all")
        items.append(toggler)
        items.append(contentsOf: foodItems)
        return items
    }
}
