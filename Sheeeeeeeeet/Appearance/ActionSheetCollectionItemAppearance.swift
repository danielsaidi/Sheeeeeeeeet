//
//  ActionSheetCancelButtonAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Jonas Ullström on 2018-03-01.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import UIKit

open class ActionSheetCollectionItemAppearance: ActionSheetItemAppearance {
    
    
    // MARK: - Initialization
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init()
        self.height = copy.height
    }
}
