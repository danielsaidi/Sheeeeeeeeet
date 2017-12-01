//
//  ActionSheetPopPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetPopPresenter: ActionSheetPresenterBase {

    
    // MARK: - Protected Functions
    
    public override func addActionSheetView(from sheet: ActionSheet, to view: UIView) {
        super.addActionSheetView(from: sheet, to: view)
        actionSheetView?.applyPopoverShadow()
    }
    
    public override func addBackgroundView(to view: UIView) {
        super.addBackgroundView(to: view)
        backgroundView?.addBlurView()
    }
    
    public override func removeActionSheetView() {
        super.removeActionSheetView()
        actionSheetView?.removePopoverShadow()
    }
}
