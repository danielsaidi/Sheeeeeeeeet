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
    
    public init(value: Any, title: String, image: UIImage? = nil, isEnabled: Bool) {
        self.isEnabled = isEnabled
        super.init(value: value, title: title, image: image)
        tapBehavior = .none
    }
    
    
    // MARK: - Properties
    
    open var isEnabled: Bool
    
    open var toggleAppearance: ActionSheetToggleItemAppearance? {
        return appearance as? ActionSheetToggleItemAppearance
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        let template = appearance.toggleItem
        self.appearance = ActionSheetToggleItemAppearance(copy: template)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let appearance = toggleAppearance else { return }
        cell.accessoryView = UIImageView(image: isEnabled ? appearance.enabledIcon : appearance.disabledIcon)
        cell.tintColor = isEnabled ? appearance.enabledTintColor : appearance.disabledTintColor
        cell.textLabel?.textColor = isEnabled ? appearance.enabledTextColor : appearance.disabledTextColor
    }
}
