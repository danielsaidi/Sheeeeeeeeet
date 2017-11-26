//
//  ActionSheetToggleItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetToggleItemAppearance: ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    override init() {
        super.init()
    }
    
    override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        disabledTextColor = copy.textColor
        disabledTintColor = copy.tintColor
        enabledTextColor = copy.textColor
        enabledTintColor = copy.tintColor
        if let copy = copy as? ActionSheetToggleItemAppearance {
            disabledIcon = copy.disabledIcon
            disabledTextColor = copy.disabledTextColor ?? disabledTextColor
            disabledTintColor = copy.disabledTintColor ?? disabledTintColor
            enabledIcon = copy.enabledIcon
            enabledTextColor = copy.enabledTextColor ?? enabledTextColor
            enabledTintColor = copy.enabledTintColor ?? enabledTintColor
        }
    }
    
    
    // MARK: - Properties
    
    public var enabledIcon: UIImage?
    public var enabledTextColor: UIColor?
    public var enabledTintColor: UIColor?
    
    public var disabledIcon: UIImage?
    public var disabledTextColor: UIColor?
    public var disabledTintColor: UIColor?
}
