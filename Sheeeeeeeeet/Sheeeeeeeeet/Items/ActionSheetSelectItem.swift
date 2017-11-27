//
//  ActionSheetSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Select items are used to let the user select one or several
 items in an action sheet.
 
 The default mode is `single select`, where the action sheet
 will be dismissed when an item is selected. You can however
 still have multiple selected items in the action sheet.
 
 To enable `multi select` mode for an action sheet, just set
 the `tapBehavior` property to `none` for every item and add
 an OK button that applies the selected items.
 
 */

import UIKit

public class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, isSelected: Bool, value: Any? = nil, image: UIImage? = nil) {
        self.isSelected = isSelected
        super.init(title: title, value: value, image: image)
    }
    
    
    // MARK: - Properties
    
    open var isSelected: Bool
    
    open var selectAppearance: ActionSheetSelectItemAppearance? {
        return appearance as? ActionSheetSelectItemAppearance
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetSelectItemAppearance(copy: appearance.selectItem)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let appearance = selectAppearance else { return }
        cell.accessoryView = UIImageView(image: isSelected ? appearance.selectedIcon : nil)
        cell.tintColor = isSelected ? appearance.selectedTintColor : appearance.tintColor
        cell.textLabel?.textColor = isSelected ? appearance.selectedTextColor : appearance.textColor
    }
    
    open override func handleTap() {
        super.handleTap()
        isSelected = !isSelected
    }
}
