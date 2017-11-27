//
//  ActionSheetHeaderViewAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetHeaderViewAppearance {
    
    
    // MARK: - Initialization
    
    public init(bottomMargin: CGFloat) {
        self.bottomMargin = bottomMargin
    }
    
    public init(copy: ActionSheetHeaderViewAppearance) {
        self.bottomMargin = copy.bottomMargin
    }
    
    
    // MARK: - Properties
    
    public var bottomMargin: CGFloat
}
