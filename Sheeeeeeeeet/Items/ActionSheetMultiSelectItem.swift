//
//  ActionSheetMultiSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-31.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Multi select items look like normal select items, but don't
 dismiss the action sheet when they are tapped. Multi select
 items can be used with a `ActionSheetMultiSelectToggleItem`,
 which selects/deselects all items in the same group.
 
 */

import UIKit

open class ActionSheetMultiSelectItem: ActionSheetSelectItem {
    
    
    // MARK: - Initialization
    
    public override init(title: String, isSelected: Bool, group: String = "", value: Any? = nil, image: UIImage? = nil) {
        super.init(title: title, isSelected: isSelected, group: group, value: value, image: image)
        tapBehavior = .none
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        super.applyAppearance(appearance)
        self.appearance = ActionSheetMultiSelectItemAppearance(copy: appearance.multiSelectItem)
    }
    
    open override func handleTap(in actionSheet: ActionSheet?) {
        guard let sheet = actionSheet else { return }
        super.handleTap(in: actionSheet)
        let toggleItems = sheet.items.flatMap { $0 as? ActionSheetMultiSelectToggleItem }
        let items = toggleItems.filter { $0.group == group }
        items.forEach { $0.updateState(for: sheet) }
    }
}
