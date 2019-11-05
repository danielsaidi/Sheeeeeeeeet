//
//  MockActionSheetPresenter.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-04-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Mockery
import UIKit

class MockActionSheetPresenter: Mock, ActionSheetPresenter {
    
    var events = ActionSheetPresenterEvents()
    var isDismissable = false
    
    typealias PresentFromViewSignature = (ActionSheet, UIViewController, UIView?, @escaping () -> Void) -> Void
    typealias PresentFromItemSignature = (ActionSheet, UIViewController, UIBarButtonItem, @escaping () -> Void) -> Void
    
    func dismiss(completion: @escaping () -> ()) {
        invoke(dismiss, args: (completion))
    }
    
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: @escaping () -> ()) {
        invoke(present, args: (sheet, vc, view, completion))
    }
    
    func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem, completion: @escaping () -> ()) {
        invoke(present, args: (sheet, vc, item, completion))
    }
    
    func refreshActionSheet() {
        invoke(refreshActionSheet, args: ())
    }
}
