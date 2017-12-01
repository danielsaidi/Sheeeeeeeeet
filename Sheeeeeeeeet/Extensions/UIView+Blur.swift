//
//  UIView+Blur.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIView {

    func addBlurView() {
        let mask = autoresizingMask
        let blurContainer = UIView(frame: frame)
        addSubview(blurContainer)
        blurContainer.frame = bounds
        blurContainer.autoresizingMask = mask
        let effect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: effect)
        blurContainer.addSubview(blurView)
        blurView.frame = bounds
        blurView.autoresizingMask = mask
    }
}
