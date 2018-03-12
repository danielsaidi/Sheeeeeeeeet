//
//  ActionSheetSingleSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Single select items look like normal select items, but will
 deselect other single select items within the same group.
 
 */

import UIKit

open class ActionSheetSingleSelectItem: ActionSheetSelectItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, isSelected: Bool, group: String = "", value: Any? = nil, image: UIImage? = nil) {
        self.group = group
        super.init(title: title, isSelected: isSelected, value: value, image: image)
    }

    
    // MARK: - Properties
    
    open var group: String
}
