//
//  ActionSheetPopPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter can be used to present an action sheet after
 it has been peeked, using peek and pop. It applies a custom
 peek-like blur and shadow to the sheet and also animates it
 nicely from the center of the screen.
 
 */

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
    
    public override func presentationTransitionStartFrame(for sheet: ActionSheet, in view: UIView) -> CGRect {
        var frame = presentationFrame(for: sheet, in: view)
        let screen = UIScreen.main.bounds.size
        frame.origin.x = screen.width/2 - frame.size.width/2
        frame.origin.y = screen.height/2 - frame.size.height/2
        return frame
    }
    
    public override func removeActionSheetView() {
        super.removeActionSheetView()
        actionSheetView?.removePopoverShadow()
    }
}
