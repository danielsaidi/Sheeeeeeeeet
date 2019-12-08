//
//  FoodMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This is the base class for all food menus in this demo app.
 */
class FoodMenu: Menu {
    
    init(title: String? = nil, items: [MenuItem]) {
        let title = title ?? FoodMenu.title
        super.init(title: title, items: items)
    }
    
    static var cancelButton: MenuItem {
        CancelButton(title: "Cancel")
    }
    
    static var okButton: MenuItem {
        OkButton(title: "OK")
    }
    
    static var title: String {
        "What do you want to eat?"
    }
}
