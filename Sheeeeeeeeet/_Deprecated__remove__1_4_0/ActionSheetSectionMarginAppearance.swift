//
//  ActionSheetSectionMarginAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "ActionSheetSectionMarginAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetSectionMarginAppearance: ActionSheetItemAppearance {
    
    public override init() {
        super.init()
        hideSeparator()
    }
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        hideSeparator()
    }
}
