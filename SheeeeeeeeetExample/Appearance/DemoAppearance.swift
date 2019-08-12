//
//  AppDelegate+Appearance.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension isolates how the example app applies colors,
 fonts etc to the example action sheets.
 
 */

import UIKit
import Sheeeeeeeeet

extension ActionSheetAppearance {
    
    static var demo: ActionSheetAppearance {
        DemoAppearance()
    }
}

class DemoAppearance: StandardActionSheetAppearance {
    
    override func apply() {
        super.apply()
        applyPopoverWidth()
    }
    
    override func applyIcons() {
        super.applyIcons()
        if #available(iOS 13.0, *) { return }
        link.linkIcon = UIImage(named: "ic_arrow_right")
        selectItem.selectedIcon = UIImage(named: "ic_checkmark")
        selectItem.unselectedIcon = UIImage(named: "ic_empty")
    }
    
    func applyPopoverWidth() {
        //ActionSheet.preferredPopoverWidth = 700
    }
}
