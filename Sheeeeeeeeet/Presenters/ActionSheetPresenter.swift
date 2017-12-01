//
//  ActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Action sheet presenters are used by Sheeeeeeeeet to present
 action sheets in different ways, e.g. by the default bottom
 slide, popping over from the tapped view etc.
 
 When implementing this presenter protocol, `present` is the
 standard way of presenting action sheets, e.g. after button
 taps, while `dismiss` is the standard (and so far only) way
 of dismissing them. `pop` can be used to specify how sheets
 should be presented after a peek (a peek could be happening
 on any view controller, not just the sheet).
 
 The `ActionSheetPresenter` protocol is a bit bloated, since
 it has a `pop` function that is called by the previewer. It
 should instead have a `behavior` parameter for the `present`
 function. It should have a default value and a `pop` option.
 The default presenter should use its pop presenter if it is
 set to `pop`, otherwise use its standard behavior (a bottom
 transition for iPhones and a popover presenter for iPads).
 
 */

import Foundation

public protocol ActionSheetPresenter: class {
    
    func dismiss(sheet: ActionSheet)
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?)
}


// MARK: - Public Functions

public extension ActionSheetPresenter {
    
    func bottomMargin(for sheet: ActionSheet, in view: UIView) -> CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return sheet.appearance.contentInset
        }
    }
    
    func getBottomFrame(for sheet: ActionSheet, in view: UIView) -> CGRect {
        var targetFrame = view.frame
        let inset = sheet.appearance.contentInset
        targetFrame = targetFrame.insetBy(dx: inset, dy: inset)
        targetFrame.size.height = sheet.contentHeight
        targetFrame.origin.y = view.frame.height - sheet.contentHeight
        targetFrame.origin.y -= bottomMargin(for: sheet, in: view)
        return targetFrame
    }
}
