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
        if let copy = copy as? ActionSheetToggleItemAppearance {
            enabledIcon = copy.enabledIcon
            disabledTextColor = copy.disabledTextColor
            disabledTintColor = copy.disabledTintColor            
        }
    }
    
    
    // MARK: - Properties
    
    public var enabledIcon: UIImage?
    
    public var disabledTextColor: UIColor?
    public var disabledTintColor: UIColor?
}
