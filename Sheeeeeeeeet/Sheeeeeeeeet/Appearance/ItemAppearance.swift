//
//  ItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ItemAppearance {
    
    
    // MARK: - Initialization
    
    init() {}
    
    init(template: ItemAppearance) {
        font = template.font
        height = template.height
        textColor = template.textColor
        tintColor = template.tintColor
    }
    
    
    // MARK: - Properties
    
    public var font: UIFont?
    public var height = 50
    public var textColor: UIColor?
    public var tintColor: UIColor?
}
