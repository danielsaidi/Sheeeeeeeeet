//
//  ActionSheetToggleItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Toggle items are used to enable and disable certain options
 in an action sheet. They are preferrably used together with
 a button that applies any changes made by the user. As such,
 toggle items have `tapBehavior` set to `none` by default.
 
 */

import UIKit

public class ActionSheetToggleItem: ActionSheetItem {

    
    // MARK: - Initialization
    
    public override init(value: Any, title: String, image: UIImage? = nil) {
        super.init(value: value, title: title, image: image)
        tapBehavior = .none
    }
}
