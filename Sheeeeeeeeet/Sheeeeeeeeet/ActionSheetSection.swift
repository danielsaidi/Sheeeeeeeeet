//
//  ActionSheetSection.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Foundation

open class ActionSheetSection: NSObject {
    
    
    // MARK: - Initialization
    
    public init(title: String?, items: [ActionSheetItem]) {
        self.title = title
        self.items = items
        super.init()
    }
    
    
    // MARK: - Properties
    
    fileprivate(set) var items: [ActionSheetItem]
    
    fileprivate(set) var title: String?
}
