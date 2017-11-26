//
//  ActionSheetPopoverApperance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetPopoverApperance {
    
    
    // MARK: - Initialization
    
    init(width: Int, cornerRadius: Int) {
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    init(copy: ActionSheetPopoverApperance) {
        self.width = copy.width
        self.cornerRadius = copy.cornerRadius
    }
    
    
    // MARK: - Properties
    
    public var cornerRadius: Int
    public var width: Int
}
