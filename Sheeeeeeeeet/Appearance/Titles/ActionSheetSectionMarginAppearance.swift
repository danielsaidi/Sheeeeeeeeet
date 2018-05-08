//
//  ActionSheetSectionMarginAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetSectionMarginAppearance: ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    public init(height: CGFloat) {
        super.init()
        self.height = height
        separatorInsets.right = 100_000_000
    }
    
    public init(copy: ActionSheetSectionMarginAppearance) {
        super.init(copy: copy)
    }
}
