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
 
 The difference between default and select items is that the
 default item has no selected state, while a select item can
 show an icon and be highlighted when selected.
 
 The default select item behavior is to dismiss the sheet on
 tap, which means that a select item by default behaves like
 a default item. To disable this behavior, set `tapBehavior`
 to `none`, then add a button that dismisses the sheet, e.g.
 an "OK" and a "Cancel" button.
 
 */

import UIKit

open class ActionSheetSelectItem: ActionSheetItem {
    
    
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
        cell.imageView?.tintColor = isSelected ? appearance.selectedTintColorLeftIcon : appearance.tintColor
        cell.textLabel?.textColor = isSelected ? appearance.selectedTextColor : appearance.textColor
    }
    
    open override func handleTap(in actionSheet: ActionSheet?) {
        super.handleTap(in: actionSheet)
        isSelected = !isSelected
    }
}
