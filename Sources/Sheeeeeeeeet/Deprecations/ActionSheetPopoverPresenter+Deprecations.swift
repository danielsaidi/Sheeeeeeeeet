//
//  ActionSheetPopoverPresenter+Deprecations.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheetPopoverPresenter {
    
    @available(*, deprecated, renamed: "isDismissableWithOrientationChange")
    var isListeningToOrientationChanges: Bool {
        get { isDismissableWithOrientationChange }
        set { isDismissableWithOrientationChange = newValue }
    }
}
