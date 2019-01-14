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
 `selectItem` appearance property is still available, so you
 can style single and multiselect items in a single way.
 
 Instead of this type, you should use any of its subclasses:
 
 * `ActionSheetSingleSelectItem`
 * `ActionSheetMultiSelectItem`
 
 */

import UIKit

open class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        isSelected: Bool,
        group: String = "",
        value: Any? = nil,
        image: UIImage? = nil,
        tapBehavior: TapBehavior = .dismiss) {
        self.isSelected = isSelected
        self.group = group
        super.init(
            title: title,
            subtitle: subtitle,
            value: value,
            image: image,
            tapBehavior: tapBehavior)
    }
    
    
    // MARK: - Properties
    
    open var group: String
    open var isSelected: Bool
    
    
    // MARK: - Deprecated
    
    @available(*, deprecated, message: "applyAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        super.applyAppearance(appearance)
        self.appearance = ActionSheetSelectItemAppearance(copy: appearance.selectItem)
    }
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetSelectItemCell(style: cellStyle, reuseIdentifier: cellReuseIdentifier)
    }
    
    open override func handleTap(in actionSheet: ActionSheet) {
        super.handleTap(in: actionSheet)
        isSelected = !isSelected
    }
}


// MARK: -

open class ActionSheetSelectItemCell: ActionSheetItemCell {
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var selectedIcon: UIImage?
    @objc public dynamic var selectedIconColor: UIColor?
    @objc public dynamic var selectedSubtitleColor: UIColor?
    @objc public dynamic var selectedTitleColor: UIColor?
    @objc public dynamic var selectedTintColor: UIColor?
    @objc public dynamic var unselectedIcon: UIImage?
    @objc public dynamic var unselectedIconColor: UIColor?
    
    
    // MARK: - Functions
    
    open override func refresh() {
        super.refresh()
        guard let item = item as? ActionSheetSelectItem else { return }
        accessoryView = UIImageView(image: item.isSelected ? selectedIcon : unselectedIcon)
        accessoryView?.tintColor = item.isSelected ? selectedIconColor : unselectedIconColor
        tintColor = item.isSelected ? selectedTintColor : tintColor
        textLabel?.textColor = item.isSelected ? selectedTitleColor : titleColor
    }
}
