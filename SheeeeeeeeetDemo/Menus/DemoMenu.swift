//
//  DemoMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

class FoodMenu: Menu {
    
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
