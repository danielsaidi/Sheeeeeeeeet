//
//  ActionSheetToggleItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetToggleItemAppearance: ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    public override init() {
        super.init()
    }
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        toggledTextColor = copy.textColor
        toggledTintColor = copy.tintColor
        untoggledTextColor = copy.textColor
        untoggledTintColor = copy.tintColor
        if let copy = copy as? ActionSheetToggleItemAppearance {
            toggledIcon = copy.toggledIcon
            toggledTextColor = copy.toggledTextColor ?? toggledTextColor
            toggledTintColor = copy.toggledTintColor ?? toggledTintColor
            untoggledIcon = copy.untoggledIcon
            untoggledTextColor = copy.untoggledTextColor ?? untoggledTextColor
            untoggledTintColor = copy.untoggledTintColor ?? untoggledTintColor
        }
    }
    
    
    // MARK: - Properties
    
    public var toggledIcon: UIImage?
    public var toggledTextColor: UIColor?
    public var toggledTintColor: UIColor?
    
    public var untoggledIcon: UIImage?
    public var untoggledTextColor: UIColor?
    public var untoggledTintColor: UIColor?
}
