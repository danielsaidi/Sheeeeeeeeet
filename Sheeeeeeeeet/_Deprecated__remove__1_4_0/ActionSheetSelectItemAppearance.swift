//
//  ActionSheetSelectItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "ActionSheetSelectItemAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetSelectItemAppearance: ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    public override init() {
        super.init()
    }
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        selectedTextColor = copy.textColor
        selectedTintColor = copy.tintColor
        let copy = copy as? ActionSheetSelectItemAppearance
        selectedIcon = copy?.selectedIcon
        selectedTextColor = copy?.selectedTextColor ?? selectedTextColor
        selectedTintColor = copy?.selectedTintColor ?? selectedTintColor
        selectedIconTintColor = copy?.selectedIconTintColor ?? selectedTintColor
        unselectedIcon = copy?.unselectedIcon
    }
    
    
    // MARK: - Properties
    
    public var selectedIcon: UIImage?
    public var selectedIconTintColor: UIColor?
    public var selectedTextColor: UIColor?
    public var selectedTintColor: UIColor?
    public var unselectedIcon: UIImage?
}
