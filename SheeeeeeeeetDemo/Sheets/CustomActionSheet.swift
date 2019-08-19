//
//  CustomActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

/**
 This action sheet shows you how to create a sheet that uses
 the `ActionSheetCustomItem` item type.
 */
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
        let type = DemoCustomViewCell.self
        let item = ActionSheetCustomItem(cellType: type) { cell in
            cell.buttonTapAction = buttonTapAction
        }
        
        return [
            ActionSheetTitle(title: "Tap a button"),
            item,
            cancelButton
        ]
    }
}
