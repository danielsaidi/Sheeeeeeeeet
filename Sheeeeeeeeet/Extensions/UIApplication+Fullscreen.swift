//
//  UIApplication+Fullscreen.swift
//  Sheeeeeeeeet
//
//  Created by Dominic Drees on 2018-11-24.
//  Copyright © 2018 Dominic Drees. All rights reserved.
//

//  This file contains internal functionality to check if an
//  app is currently running in fullscreen or not.

import UIKit

extension UIApplication {
    
    var isFullScreen: Bool {
        guard let win = delegate?.window, let window = win else { return false }
        return window.frame.width == window.screen.bounds.width
    }
}
