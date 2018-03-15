//
//  ActionSheetCollectionItemAppearance.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström (ullstrm) on 2018-02-23.
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
