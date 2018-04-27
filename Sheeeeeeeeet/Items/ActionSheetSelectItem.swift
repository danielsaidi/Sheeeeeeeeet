//
//  ActionSheetSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Select items are used to let the user select one or several
 items in an action sheet. Unlike the `ActionSheetItem` type,
 this type has an `isSelected` state, a selected icon and an
 extended appearance.
 
 This item type is not meant to be used directly. However, a
 `selectItem` appearance property is still available, if you
 want to style single and multiselect items the same way.
 
 Instead of this type, you should use any of its subclasses:
 
 * `ActionSheetSingleSelectItem` should be used whenever the
 user should only be able to select a single item in a sheet.
 Single select items automatically deselect all other single
 select items in the same group when tapped, which means you
 can use many groups in the same sheet. A single select item
 by default dismisses the action sheet when it is tapped. To
 change this behavior, set `tapBehavior` to `.none`.
 
 * `ActionSheetMultiSelectItem` should be used when the user
 should be able to select one or several items in a sheet. A
 multiselect item will not affect any other select items. It
 can also be used with an `ActionSheetMultiSelectToggleItem`,
 which can automatically toggle the selection state of every
 multiselect item in the same group. A multiselect item does
 not dismiss the sheet, since the user will most probably be
 in a context, where any changes made in the sheet should be
 applied with an OK button. See the example app.
 
 */

import UIKit

open class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    init(title: String, isSelected: Bool, group: String = "", value: Any? = nil, image: UIImage? = nil) {
        self.isSelected = isSelected
        self.group = group
        super.init(title: title, value: value, image: image)
    }
    
    
    // MARK: - Properties
    
    open var group: String
    
    open var isSelected: Bool
    
    open var selectAppearance: ActionSheetSelectItemAppearance? {
        return appearance as? ActionSheetSelectItemAppearance
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        super.applyAppearance(appearance)
        self.appearance = ActionSheetSelectItemAppearance(copy: appearance.selectItem)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let appearance = selectAppearance else { return }
        cell.accessoryView = isSelected ? UIImageView(image: appearance.selectedIcon) : nil
        cell.accessoryView?.tintColor = isSelected ? appearance.selectedIconTintColor : appearance.tintColor
        cell.tintColor = isSelected ? appearance.selectedTintColor : appearance.tintColor
        cell.textLabel?.textColor = isSelected ? appearance.selectedTextColor : appearance.textColor
    }
    
    open override func handleTap(in actionSheet: ActionSheet?) {
        super.handleTap(in: actionSheet)
        isSelected = !isSelected
    }
}
