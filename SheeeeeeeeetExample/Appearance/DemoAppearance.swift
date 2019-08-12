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
    
    /**
     Get an instance of the demo appearance.
    */
    static var demo: ActionSheetAppearance {
        DemoAppearance()
    }
}

/**
 This is a demo-specific action sheet appearance. It applies
 app-specific icons for pre-iOS 13 devices.
 
 If you use Sheeeeeeeeet in apps with a deployment target of
 iOS 12 and below, you must provide Sheeeeeeeeet with custom
 icon, like below. In iOS 13 and above, Sheeeeeeeeet applies
 standard SF Symbols icons (which you also can override).
 */
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
