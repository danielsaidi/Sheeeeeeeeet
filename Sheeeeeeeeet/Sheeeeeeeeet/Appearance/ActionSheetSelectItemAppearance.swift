//
//  ActionSheetSelectItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetSelectItemAppearance: ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    override init() {
        super.init()
    }
    
    override init(template: ActionSheetItemAppearance) {
        super.init(template: template)
        selectedTextColor = template.textColor
        selectedTintColor = template.tintColor
    }
    
    convenience init(template: ActionSheetSelectItemAppearance) {
        self.init(template: template)
        selectedIcon = template.selectedIcon
        selectedTextColor = template.selectedTextColor
        selectedTintColor = template.selectedTintColor
    }
    
    
    // MARK: - Properties
    
    public var selectedIcon: UIImage?
    public var selectedTextColor: UIColor?
    public var selectedTintColor: UIColor?
}
