//
//  DemoAppearance.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2018-02-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class DemoAppearance: UIImageView {

    static func apply() {
        
        let blue = UIColor(hex: 0x0FA2F5)
        let green = UIColor(hex: 0x81c03f)
        let pink = UIColor(hex: 0xec5f72)
        let purple = UIColor(hex: 0xd9007b)
        
        let robotoBlack = "Roboto-Black"
        let robotoMedium = "Roboto-Medium"
        let robotoRegular = "Roboto-Regular"
        
        let appearance = ActionSheetAppearance.standard
        
        appearance.item.font = UIFont(name: robotoRegular, size: 17)
        appearance.item.textColor = .darkText
        appearance.item.tintColor = .darkGray
        appearance.item.subtitleFont = UIFont(name: robotoRegular, size: 14)
        appearance.item.subtitleTextColor = blue
        
        appearance.title.separatorInsets.right = .greatestFiniteMagnitude
        appearance.title.font = UIFont(name: robotoMedium, size: 15)
        
        appearance.sectionTitle.separatorInsets.right = .greatestFiniteMagnitude
        appearance.sectionTitle.font = UIFont(name: robotoMedium, size: 13)
        appearance.sectionTitle.height = 20
        
        appearance.sectionMargin.height = 20
        
        appearance.selectItem.selectedIcon = UIImage(named: "ic_checkmark")
        appearance.selectItem.selectedTintColor = blue
        appearance.selectItem.selectedTextColor = green
        appearance.selectItem.selectedIconTintColor = purple
        
        appearance.singleSelectItem.selectedIcon = UIImage(named: "ic_checkmark")
        appearance.singleSelectItem.selectedTintColor = green
        appearance.singleSelectItem.selectedTextColor = purple
        appearance.singleSelectItem.selectedIconTintColor = blue
        
        appearance.linkItem.linkIcon = UIImage(named: "ic_arrow_right")
        
        appearance.okButton.textColor = .darkGray
        appearance.okButton.font = UIFont(name: robotoBlack, size: 17)
        
        appearance.dangerButton.textColor = pink
        appearance.dangerButton.font = UIFont(name: robotoMedium, size: 17)
        
        appearance.cancelButton.textColor = .lightGray
        appearance.cancelButton.font = UIFont(name: robotoMedium, size: 17)
    }
}
