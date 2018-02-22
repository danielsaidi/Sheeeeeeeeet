//
//  ActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Action sheet presenters are used by Sheeeeeeeeet to present
 action sheets in different ways, e.g. with a default bottom
 slide, showing a popover from the tapped view etc.
 
 When implementing this presenter protocol, `present` is the
 standard way of presenting action sheets, e.g. after button
 taps, while `dismiss` is the standard (and so far only) way
 of dismissing them. `pop` can be used to specify how sheets
 should be presented after a peek (a peek could be happening
 on any view controller, not just the sheet).
 
 */

import Foundation

public protocol ActionSheetPresenter: class {
    
    func dismiss(completion: @escaping () -> ())
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?)
    func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem)
}
