//
//  CustomMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-20.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu contains a custom item, which in this demo app is
 rendered as a custom `UIKit` view.
 */
class CustomMenu: FoodMenu {
    
    init(buttonTapAction: @escaping (UIButton) -> ()) {
        let items = CustomMenu.items(buttonTapAction: buttonTapAction)
        super.init(title: "Custom Menu", items: items)
    }
}

private extension CustomMenu {
    
    static func items(buttonTapAction: @escaping (UIButton) -> ()) -> [MenuItem] {
        let itemType = DemoCustomViewCell.self
        let item = CustomItem(itemType: itemType) { item in
            item.buttonTapAction = buttonTapAction
        }
        return [item, FoodMenu.cancelButton]
    }
}
