//
//  CustomActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This example action sheet demonstrates how to create action
 sheets that use the `ActionSheetCustomItem` item type.
 
 As you can see, the button tap action is sent in as a param
 when creating the sheet. This action block can do anything.
 
 */

import UIKit
import Sheeeeeeeeet

class CustomActionSheet: ActionSheet {
    
    init(options: [FoodOption], buttonTapAction: @escaping (UIButton) -> ()) {
        let items = CustomActionSheet.items(for: options, buttonTapAction: buttonTapAction)
        super.init(items: items) { _, _ in }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


// MARK: - Private Functions

private extension CustomActionSheet {
    
    static func items(for options: [FoodOption], buttonTapAction: @escaping (UIButton) -> ()) -> [ActionSheetItem] {
        let customType = MyCustomViewCell.self
        let customItem = ActionSheetCustomItem(cellType: customType) { cell in
            cell.buttonTapAction = buttonTapAction
        }
        
        return [
            ActionSheetTitle(title: "Tap a button"),
            customItem,
            cancelButton
        ]
    }
}
