//
//  ActionSheet+Appearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ActionSheet {
    
    /**
     Apply a certain appearance. If you call this without an
     appearance instance, the standard appearance is applied.
    */
    static func applyAppearance(_ appearance: ActionSheetAppearance = .standard, force: Bool = true) {
        guard force || ActionSheetAppearance.global == nil else { return }
        ActionSheetAppearance.global = appearance
        appearance.apply()
    }
}
