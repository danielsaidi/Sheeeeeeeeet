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
    
    public init(width: Int, cornerRadius: Int) {
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    public init(copy: ActionSheetPopoverApperance) {
        self.width = copy.width
        self.cornerRadius = copy.cornerRadius
    }
    
    
    // MARK: - Properties
    
    public var cornerRadius: Int
    public var width: Int
}

