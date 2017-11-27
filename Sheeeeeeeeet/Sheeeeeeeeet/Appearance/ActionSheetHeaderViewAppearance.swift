//
//  ActionSheetHeaderViewAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Saidi Daniel (BookBeat) on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetHeaderViewAppearance {
    
    
    // MARK: - Initialization
    
    public init(height: Int) {
        self.height = height
    }
    
    public init(copy: ActionSheetHeaderViewAppearance) {
        self.height = copy.height
    }
    
    
    // MARK: - Properties
    
    public var height: Int
}
