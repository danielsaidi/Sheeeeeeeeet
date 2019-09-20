//
//  SectionMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This demo menu creates a standard `MenuItem` for every food
 option, then adds them to one of two sections. It also adds
 a cancel button at the end of the item list.
*/
class SectionMenu: FoodMenu {
    
    init(food: [FoodOption]) {
        let items = SectionMenu.items(for: food)
        super.init(items: items)
    }
}

private extension SectionMenu {
    
    static func items(for food: [FoodOption]) -> [MenuItem] {
        var items = [MenuItem]()
        items.append(SectionTitle(title: "Cheap"))
        let cheap = food.filter { $0.isCheap }.map { $0.toMenuItem() }
        items.append(contentsOf: cheap)
        items.append(SectionMargin())
        items.append(SectionTitle(title: "Expensive"))
        let expensive = food.filter { !$0.isCheap }.map { $0.toMenuItem() }
        items.append(contentsOf: expensive)
        items.append(FoodMenu.cancelButton)
        return items
    }
}
