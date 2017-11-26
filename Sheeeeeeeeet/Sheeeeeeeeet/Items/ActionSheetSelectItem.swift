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
 which means that the action sheet will be dismissed when an
 item is selected. If you want to use multi select, just set
 the `tapBehavior` property to `none` for every item and add
 a button to the action sheet, that applies any changes made
 by the user.
 
 */

import UIKit

public class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(value: Any, title: String, image: UIImage? = nil, isSelected: Bool) {
        self.isSelected = isSelected
        super.init(value: value, title: title, image: image)
    }
    
    
    // MARK: - Properties
    
    open var isSelected: Bool
    
    open var selectAppearance: ActionSheetSelectItemAppearance? {
        return appearance as? ActionSheetSelectItemAppearance
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        let template = appearance.selectItem
        self.appearance = ActionSheetSelectItemAppearance(copy: template)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let appearance = selectAppearance else { return }
        cell.accessoryView = UIImageView(image: isSelected ? appearance.selectedIcon : nil)
        cell.tintColor = isSelected ? appearance.selectedTintColor : appearance.tintColor
        cell.textLabel?.textColor = isSelected ? appearance.selectedTextColor : appearance.textColor
    }
}

