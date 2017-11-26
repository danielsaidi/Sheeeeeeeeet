//
//  ActionSheetItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    init() {}
    
    init(template: ActionSheetItemAppearance) {
        font = template.font
        height = template.height
        separatorInsets = template.separatorInsets
        textColor = template.textColor
        tintColor = template.tintColor
    }
    
    
    // MARK: - Properties
    
    public var font: UIFont?
    public var height = 50
    public var separatorInsets: UIEdgeInsets = .zero
    public var textColor: UIColor?
    public var tintColor: UIColor?
}
