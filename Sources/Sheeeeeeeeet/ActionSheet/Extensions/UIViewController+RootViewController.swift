//
//  UIViewController+RootViewController.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIViewController {

    /**
     Resolve the root view controller of the current app.
     */
    var rootViewController: UIViewController {
        parent?.rootViewController ?? self
    }
}
