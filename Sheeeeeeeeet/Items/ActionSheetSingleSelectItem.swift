//
//  ActionSheetSingleSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Single select items look like normal select items, but will
 deselect other single select items within the same `group`.
 
 */

import UIKit

open class ActionSheetSingleSelectItem: ActionSheetSelectItem {
    
    
    // MARK: - Initialization
    
    public override init(title: String, isSelected: Bool, group: String = "", value: Any? = nil, image: UIImage? = nil) {
        super.init(title: title, isSelected: isSelected, group: group, value: value, image: image)
    }
    
    
     // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        super.applyAppearance(appearance)
        self.appearance = ActionSheetSingleSelectItemAppearance(copy: appearance.singleSelectItem)
    }
    
    open override func handleTap(in actionSheet: ActionSheet?) {
        guard let sheet = actionSheet else { return }
        let items = sheet.items.flatMap { $0 as? ActionSheetSingleSelectItem }
        let deselectItems = items.filter { $0.group == group }
        deselectItems.forEach { $0.isSelected = false }
        isSelected = true
    }
}
