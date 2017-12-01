//
//  PopActionSheetPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class PopActionSheetPresenter: ActionSheetPresenter {

    // MARK: - Properties
    
    public var actionSheetView: UIView?
    public var backgroundView: UIView?
    
    
    
    public func dismiss(sheet: ActionSheet) {
        
    }
    
    public func pop(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        present(sheet: sheet, in: vc, from: view)
    }
    
    public func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        
    }
}
