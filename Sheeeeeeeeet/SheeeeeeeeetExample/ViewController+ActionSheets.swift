//
//  ViewController+Sheets.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ViewController {
    
    func getFoodOptions() -> [FoodOption] {
        return [.fast, .homeMade, .fancy, .none]
    }
    
    func createDefaultActionSheet(
        action: @escaping ActionSheetItemSelectAction) -> ActionSheet {
        let options = getFoodOptions()
        var items = options.map { ActionSheetItem(title: $0.displayName, value: $0, image: $0.image) }
        items.insert(ActionSheetTitle(title: "Pick your favorite food"), at: 0)
        items.append(ActionSheetCancelButton(title: "CANCEL"))
        return ActionSheet(items: items, action: action)
    }
}
