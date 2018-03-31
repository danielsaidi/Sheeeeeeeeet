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
 
 Use this class when you prefer the default `ActionSheetItem`
 item behavior but also want to highlight currently selected
 items in a sheet. A select items, by default, dismisses the
 action sheet when it's tapped, much like the base item.
 
 You can also use any of the subclasses instead of this type:
 
 * `ActionSheetSingleSelectItem` automatically deselects any
 other single select items in the same group. This means you
 don't have to implement this behavior.
 * `ActionSheetMultiSelectItem` can be used together with an
 `ActionSheetMultiSelectToggleItem`, which can automatically
 select/deselect all multi select items in the same group.
 
 The subclasses also have their own extended appearances, so
 you can customize them. These appearances inherit this base
 appearance, however.
 
 The `group` property is not used by this item, although you
 can use it in your custom code. It is, however, used by the
 single select item and the multi select item toggler.
 
 */

import UIKit

open class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, isSelected: Bool, group: String = "", value: Any? = nil, image: UIImage? = nil) {
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
