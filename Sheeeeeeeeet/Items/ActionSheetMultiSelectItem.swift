//
//  ActionSheetMultiSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-31.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Multiselect items should be used when a user should be able
 to select one or several items.
 
 Multi select items does not dismiss the sheet when they are
 tapped, since they are most probably in a context where the
 user should apply any changes made in the sheet.
 
 Multi select items can be used together with the title-like
 `ActionSheetMultiSelectToggleItem` item type, which selects
 and deselects all items in a certain group.
 
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
