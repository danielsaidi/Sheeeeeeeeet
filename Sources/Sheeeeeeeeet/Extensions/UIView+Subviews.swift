//
//  UIView+Subviews.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-02-08.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIView {

    /**
     This internal helper function helps adding a subview to
     fill its parents entire frame.
     */
    func addSubview(_ subview: UIView, fill: Bool) {
        addSubview(subview)
        guard fill else { return }
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
