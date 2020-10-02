//
//  MockActionSheetPresenter.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-04-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import MockingKit
import UIKit

class MockActionSheetPresenter: Mock, ActionSheetPresenter {
    
    lazy var dismissRef = MockReference(dismiss)
    lazy var presentFromViewRef = MockReference(present as (ActionSheet, UIViewController, UIView?, @escaping () -> Void) -> Void)
    lazy var presentFromBarItemRef = MockReference(present as (ActionSheet, UIViewController, UIBarButtonItem, @escaping () -> Void) -> Void)
    lazy var refreshActionSheetRef = MockReference(refreshActionSheet)
    
    var events = ActionSheetPresenterEvents()
    var isDismissable = false
    var shouldDismissOnDidEnterBackground = false
    
    typealias PresentFromViewSignature = (ActionSheet, UIViewController, UIView?, @escaping () -> Void) -> Void
    typealias PresentFromItemSignature = (ActionSheet, UIViewController, UIBarButtonItem, @escaping () -> Void) -> Void
    
    func dismiss(completion: @escaping () -> ()) {
        call(dismissRef, args: (completion))
    }
    
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: @escaping () -> Void) {
        call(presentFromViewRef, args: (sheet, vc, view, completion))
    }
    
    func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem, completion: @escaping () -> Void) {
        call(presentFromBarItemRef, args: (sheet, vc, item, completion))
    }
    
    func refreshActionSheet() {
        call(refreshActionSheetRef, args: ())
    }
}
