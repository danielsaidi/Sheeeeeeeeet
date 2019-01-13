//
//  ActionSheetDangerButtonAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "ActionSheetDangerButtonAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetDangerButtonAppearance: ActionSheetButtonAppearance {
    
    public override init() {
        super.init()
        textColor = ActionSheetDangerButtonCell.appearance().titleColor ?? .red
    }
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        textColor = ActionSheetDangerButtonCell.appearance().titleColor ?? .red
    }
}
