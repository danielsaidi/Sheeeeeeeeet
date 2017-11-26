//
//  ActionSheetSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Select items are used to let the user select one or several
 items in an action sheet. The default mode is single select,
 which means that the action sheet will dismiss whenever the
 user selects an item. If you want to use multi select, just
 set the `tapBehavior` property to `none` for every item and
 add a button that applies any selection made by the user.
 
 */

import UIKit

public class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public override init(value: Any, title: String, image: UIImage? = nil) {
        super.init(value: value, title: title, image: image)
    }
}

