//
//  ActionSheet+Deprecated.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheet {
    
    @available(*, deprecated, renamed: "HeaderConfiguration")
    typealias HeaderViewConfiguration = HeaderConfiguration
    
    @available(*, deprecated, renamed: "headerConfiguration")
    var headerViewConfiguration: HeaderViewConfiguration {
        get { headerConfiguration }
        set { headerConfiguration = newValue }
    }
}

public extension ActionSheetAppearance {
    
    @available(*, deprecated, renamed: "destructiveButton")
    var dangerButton: ActionSheetDestructiveButtonCell { destructiveButton }
}

public extension ActionSheetPopoverPresenter {
    
    @available(*, deprecated, renamed: "isDismissableWithOrientationChange")
    var isListeningToOrientationChanges: Bool {
        get { isDismissableWithOrientationChange }
        set { isDismissableWithOrientationChange = newValue }
    }
}

public typealias ActionSheetDangerButtonCell = ActionSheetDestructiveButtonCell
