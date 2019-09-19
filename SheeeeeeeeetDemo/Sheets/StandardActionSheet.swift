//
//  StandardActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

extension Menu {

    /**
     This function creates a standard food picker menu, with
     only standard menu items.
     */
    static func standard(with options: [FoodOption]) -> Menu {
        var items = options.map { $0.toMenuItem() }
        items.insert(MenuTitle(title: "What do you want to eat?"), at: 0)   // TODO: The menu should have a title prop
        items.append(CancelButton(title: "Cancel"))
        return Menu(items: items)
    }
}

/**
 This is a standard food picker action sheet, with only standard action sheet items.
 */
class StandardActionSheet: ActionSheet {
    
    convenience init(options: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        self.init(menu: .standard(with: options)) { _, item in
            if item.value == nil { return }
            action([item])
        }
    }
}
