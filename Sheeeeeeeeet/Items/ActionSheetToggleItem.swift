//
//  ActionSheetToggleItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Toggle items are used to enable and disable certain options
 in an action sheet. They are preferrably used together with
 a button that applies any changes made by the user. As such,
 toggle items have `tapBehavior` set to `none` by default.
 
 */

import UIKit

public class ActionSheetToggleItem: ActionSheetItem {

    
    // MARK: - Initialization
    
    public init(title: String, isToggled: Bool, value: Any? = nil, image: UIImage? = nil) {
        self.isToggled = isToggled
        super.init(title: title, value: value, image: image)
        tapBehavior = .none
    }
    
    
    // MARK: - Properties
    
    open var isToggled: Bool
    
    open var toggleAppearance: ActionSheetToggleItemAppearance? {
        return appearance as? ActionSheetToggleItemAppearance
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetToggleItemAppearance(copy: appearance.toggleItem)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let appearance = toggleAppearance else { return }
        cell.accessoryView = UIImageView(image: isToggled ? appearance.toggledIcon : appearance.untoggledIcon)
        cell.tintColor = isToggled ? appearance.toggledTintColor : appearance.untoggledTintColor
        cell.textLabel?.textColor = isToggled ? appearance.toggledTextColor : appearance.untoggledTextColor
    }
    
    open override func handleTap() {
        super.handleTap()
        isToggled = !isToggled
    }
}
