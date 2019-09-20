//
//  ActionSheetBackgroundView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This view is used as an overlay behind the action sheet. It
 provides a bit of additional contrast.
 */
open class ActionSheetBackgroundView: UIView {
    
    open func setup(in sheet: ActionSheet) {
        clipsToBounds = true
        sheet.view.addSubview(self, fill: true)
    }
}
