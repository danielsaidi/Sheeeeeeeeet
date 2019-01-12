//
//  ActionSheetPopoverAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "ActionSheetPopoverAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetPopoverAppearance {
    
    
    // MARK: - Initialization
    
    public init(width: CGFloat? = nil) {
        self.width = width
    }
    
    public init(copy: ActionSheetPopoverAppearance) {
        self.width = copy.width
    }
    
    
    // MARK: - Properties

    public var width: CGFloat?
}
