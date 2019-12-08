//
//  ActionSheetPopoverPresenter+Deprecations.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//

import UIKit

public extension ActionSheetPopoverPresenter {
    
    @available(*, deprecated, renamed: "isDismissableWithOrientationChange")
    var isListeningToOrientationChanges: Bool {
        get { isDismissableWithOrientationChange }
        set { isDismissableWithOrientationChange = newValue }
    }
}
