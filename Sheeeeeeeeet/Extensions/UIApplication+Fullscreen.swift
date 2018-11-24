//
//  UIApplication+Fullscreen.swift
//  Sheeeeeeeeet
//
//  Created by Dominic Drees on 2018-11-24.
//  Copyright © 2018 Dominic Drees. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public var isFullScreen: Bool {
        guard let win = delegate?.window, let window = win else { return false }
        return window.frame.width == window.screen.bounds.width
    }
}
