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

extension AppDelegate {
    
    private var robotoBlack: String { return "Roboto-Black" }
    private var robotoMedium: String { return "Roboto-Medium" }
    private var robotoRegular: String { return "Roboto-Regular" }
    
    func applyAppearance() {
        
        let blue = UIColor(hex: 0x0FA2F5)
        let green = UIColor(hex: 0x81c03f)
        let pink = UIColor(hex: 0xec5f72)
        let purple = UIColor(hex: 0xd9007b)
        let red = UIColor(hex: 0xff3333)
        
        let appearance = ActionSheetAppearance.standard
        
        applyCornerRadius()
        applyTitleFonts()
        
//        appearance.popover.width = 500
        
        
        appearance.item.textColor = .darkText
        appearance.item.tintColor = .darkGray
        appearance.item.subtitleFont = UIFont(name: robotoRegular, size: 14)
        appearance.item.subtitleTextColor = blue
        
//        appearance.separatorColor = .red
//        appearance.itemsSeparatorColor = .blue
//        appearance.buttonsSeparatorColor = .green
        
        appearance.title.hideSeparator()
        
        appearance.sectionTitle.hideSeparator()
        appearance.sectionTitle.height = 20
        
        appearance.sectionMargin.height = 20
        
        appearance.selectItem.selectedIcon = UIImage(named: "ic_checkmark")
        appearance.selectItem.unselectedIcon = UIImage(named: "ic_empty")
        appearance.selectItem.selectedTintColor = blue
        appearance.selectItem.selectedTextColor = green
        appearance.selectItem.selectedIconTintColor = purple
        
        appearance.singleSelectItem.selectedTintColor = green
        appearance.singleSelectItem.selectedTextColor = purple
        appearance.singleSelectItem.selectedIconTintColor = blue
        
        appearance.multiSelectItem.selectedTintColor = purple
        appearance.multiSelectItem.selectedTextColor = blue
        appearance.multiSelectItem.selectedIconTintColor = green
        
        appearance.multiSelectToggleItem.hideSeparator()
        appearance.multiSelectToggleItem.selectAllTextColor = .lightGray
        appearance.multiSelectToggleItem.deselectAllTextColor = red
        
        appearance.linkItem.linkIcon = UIImage(named: "ic_arrow_right")
        
        appearance.okButton.textColor = .darkGray
        
        appearance.dangerButton.textColor = pink
        
        appearance.cancelButton.textColor = .lightGray
        
        applyLegacyAppearance(appearance)
    }
}


private extension AppDelegate {
    
    func applyCornerRadius() {
        ActionSheetHeaderView.appearance().cornerRadius = 10
        ActionSheetTableView.appearance().cornerRadius = 10
        //ActionSheetTableView.appearance(whenContainedInInstancesOf: [MultiSelectActionSheet.self]).cornerRadius = 20
    }
    
    func applyTitleFonts() {
        ActionSheetItemCell.appearance().titleFont = UIFont(name: robotoRegular, size: 17)
        ActionSheetSectionTitleCell.appearance().titleFont = UIFont(name: robotoMedium, size: 13)
        ActionSheetTitleCell.appearance().titleFont = UIFont(name: robotoMedium, size: 15)
    }
}


private extension AppDelegate {
    
    func applyLegacyAppearance(_ appearance: ActionSheetAppearance) {
        applyLegacyFonts(with: appearance)
    }
    
    func applyLegacyFonts(with appearance: ActionSheetAppearance) {
        //appearance.item.font = UIFont(name: robotoRegular, size: 17)
        //appearance.title.font = UIFont(name: robotoMedium, size: 15)
        //appearance.sectionTitle.font = UIFont(name: robotoMedium, size: 13)
        //appearance.multiSelectToggleItem.font = UIFont(name: robotoMedium, size: 13)
        appearance.okButton.font = UIFont(name: robotoBlack, size: 17)
        appearance.dangerButton.font = UIFont(name: robotoMedium, size: 17)
        appearance.cancelButton.font = UIFont(name: robotoMedium, size: 17)
    }
}
