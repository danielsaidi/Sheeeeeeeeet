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
    
    override init(template: ActionSheetItemAppearance) {
        super.init(template: template)
        disabledTextColor = template.textColor
        disabledTintColor = template.tintColor
    }
    
    convenience init(template: ActionSheetToggleItemAppearance) {
        self.init(template: template)
        icon = template.icon
        disabledTextColor = template.disabledTextColor
        disabledTintColor = template.disabledTintColor
    }
    
    
    // MARK: - Properties
    
    public var icon: UIImage?
    
    public var disabledTextColor: UIColor?
    public var disabledTintColor: UIColor?
}
