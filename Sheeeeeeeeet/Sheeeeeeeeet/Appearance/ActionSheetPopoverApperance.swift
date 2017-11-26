//
//  ActionSheetPopoverApperance.swift
//  Sheeeeeeeeet
//
//  Created by Saidi Daniel (BookBeat) on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetPopoverApperance {
    
    
    // MARK: - Initialization
    
    init(width: Int, cornerRadius: Int) {
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    init(template: ActionSheetPopoverApperance) {
        self.width = template.width
        self.cornerRadius = template.cornerRadius
    }
    
    
    // MARK: - Properties
    
    public var cornerRadius: Int
    public var width: Int
}

