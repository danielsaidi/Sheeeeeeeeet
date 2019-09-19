//
//  SingleSelectFoodMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

class SingleSelectFoodMenu: FoodMenu {
    
    init(food: [FoodOption]) {
        let items = SingleSelectFoodMenu.items(for: food)
        super.init(items: items)
    }
}

private extension SingleSelectFoodMenu {
    
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
