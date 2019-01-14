//
//  ActionSheetMultiSelectToggleItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-31.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "ActionSheetMultiSelectToggleItemAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetMultiSelectToggleItemAppearance: ActionSheetItemAppearance {
    
    public override init() {
        super.init()
    }
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        let copy = copy as? ActionSheetMultiSelectToggleItemAppearance
        deselectAllTextColor = copy?.deselectAllTextColor
        selectAllTextColor = copy?.selectAllTextColor
    }
    
    public var deselectAllTextColor: UIColor?
    public var selectAllTextColor: UIColor?
}
