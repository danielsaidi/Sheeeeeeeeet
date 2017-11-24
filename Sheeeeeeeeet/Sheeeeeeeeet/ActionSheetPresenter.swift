//
//  ActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol ActionSheetPresenter: class {
    
    func dismiss(sheet: ActionSheet, completion: (() -> ())?)
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: (() -> ())?)
}
