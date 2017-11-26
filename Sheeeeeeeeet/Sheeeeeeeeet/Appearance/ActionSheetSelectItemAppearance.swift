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
    
    override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        selectedTextColor = copy.textColor
        selectedTintColor = copy.tintColor
        if let copy = copy as? ActionSheetSelectItemAppearance {
            selectedIcon = copy.selectedIcon
            selectedTextColor = copy.selectedTextColor ?? selectedTextColor
            selectedTintColor = copy.selectedTintColor ?? selectedTintColor
        }
    }
    
    
    // MARK: - Properties
    
    public var selectedIcon: UIImage?
    public var selectedTextColor: UIColor?
    public var selectedTintColor: UIColor?
}
