//
//  ActionSheetSingleSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Single select items look like normal select items, but will
 deselect other single select items within the same group. A
 single select item doesn't deselect itself when tapped many
 consecutive times.
 
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
    
    
    // MARK: - Functions
    
    open override func handleTap(in actionSheet: ActionSheet?) {
        guard let sheet = actionSheet else { return }
        let items = sheet.items.flatMap { $0 as? ActionSheetSingleSelectItem }
        let deselectItems = items.filter { $0.group == group }
        deselectItems.forEach { $0.isSelected = false }
        isSelected = true
    }
}
