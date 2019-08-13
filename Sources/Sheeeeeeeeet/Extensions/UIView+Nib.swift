//
//  UIView+Nib.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-10-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Get the view's default nib.
     */
    static var defaultNib: UINib {
        return UINib(nibName: className, bundle: bundle)
    }
}
