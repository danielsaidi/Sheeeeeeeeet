//
//  ActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Action sheet presenters are used to present and dismiss any
 action sheet in different ways, for instance with a default
 bottom slide-in, in a popover etc.
 
 Instead of a delegate, the presenter protocol uses an event
 property with events that you can subscribe to.
 */
public protocol ActionSheetPresenter: AnyObject {
    
    var events: ActionSheetPresenterEvents { get set }
    
    func dismiss(completion: @escaping () -> Void)
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?, completion: @escaping () -> Void)
    func present(sheet: ActionSheet, in vc: UIViewController, from item: UIBarButtonItem, completion: @escaping () -> Void)
    func refreshActionSheet()
}


/**
 This struct represents various events that can be triggered
 for a presenter.
 */
public struct ActionSheetPresenterEvents {
    
    public init() {}
    
    public var didDismissWithBackgroundTap: (() -> Void)?
}
