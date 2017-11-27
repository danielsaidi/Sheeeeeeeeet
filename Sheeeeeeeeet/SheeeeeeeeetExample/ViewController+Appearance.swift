//
//  ViewController+Appearance.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ViewController {
    
    func applyActionSheetAppearance() {
        let robotoMedium = "Roboto-Medium"
        let robotoRegular = "Roboto-Regular"
        
        let appearance = ActionSheetAppearance.standard
        appearance.item.font = UIFont(name: robotoRegular, size: 17)
        
        appearance.title.separatorInsets.right = .greatestFiniteMagnitude
        appearance.title.font = UIFont(name: robotoMedium, size: 15)
    }
}
