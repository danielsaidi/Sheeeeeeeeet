//
//  UIView+PopShadow.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIView {

    func applyPopoverShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.15
    }
    
    func removePopoverShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 0
        layer.shadowOpacity = 0
    }
}
