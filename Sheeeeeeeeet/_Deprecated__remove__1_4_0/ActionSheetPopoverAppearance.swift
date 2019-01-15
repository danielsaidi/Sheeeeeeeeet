//
//  ActionSheetPopoverAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetPopoverAppearance {
    
    public init(width: CGFloat? = nil) {
        self.width = width
    }
    
    public init(copy: ActionSheetPopoverAppearance) {
        self.width = copy.width
    }
    
    public var width: CGFloat?
}
