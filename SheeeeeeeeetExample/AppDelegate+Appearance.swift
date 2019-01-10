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
    
    func applyAppearance() {
        
        let appearance = ActionSheetAppearance.standard
        
        applyCornerRadius()
        applyTitleFonts()
        
//        appearance.popover.width = 500
        
        
        appearance.item.textColor = .darkText
        appearance.item.tintColor = .darkGray
        appearance.item.subtitleFont = robotoRegular(size: 14)
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
        ActionSheetItemCell.appearance().titleFont = robotoRegular(size: 17)
        ActionSheetLinkItemCell.appearance().titleFont = robotoRegular(size: 17)
        ActionSheetMultiSelectToggleItemCell.appearance().titleFont = robotoMedium(size: 13)
        ActionSheetSectionTitleCell.appearance().titleFont = robotoMedium(size: 13)
        ActionSheetTitleCell.appearance().titleFont = robotoMedium(size: 15)
        ActionSheetOkButtonCell.appearance().titleFont = robotoBlack(size: 17)
        ActionSheetDangerButtonCell.appearance().titleFont = robotoMedium(size: 17)
        ActionSheetCancelButtonCell.appearance().titleFont = robotoRegular(size: 17)
    }
}


// MARK: - Fonts

private extension AppDelegate {
    
    func robotoBlack(size: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Black", size: size)
    }
    
    func robotoMedium(size: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Medium", size: size)
    }
    
    func robotoRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: size)
    }
}


// MARK: - Colors

private extension AppDelegate {
    
    var blue: UIColor { return UIColor(hex: 0x0FA2F5) }
    var green: UIColor { return UIColor(hex: 0x81c03f) }
    var pink: UIColor { return UIColor(hex: 0xec5f72) }
    var purple: UIColor { return UIColor(hex: 0xd9007b) }
    var red: UIColor { return UIColor(hex: 0xff3333) }
}


// MARK: - Legacy

private extension AppDelegate {
    
    func applyLegacyAppearance(_ appearance: ActionSheetAppearance) {
        applyLegacyFonts(with: appearance)
    }
    
    func applyLegacyFonts(with appearance: ActionSheetAppearance) {
//        appearance.item.font = robotoRegular(size: 17)
//        appearance.linkItem.font = robotoRegular(size: 170)
//        appearance.title.font = robotoMedium(size: 15)
//        appearance.sectionTitle.font = robotoMedium(size: 13)
//        appearance.multiSelectToggleItem.font = robotoMedium(size: 13)
//        appearance.okButton.font = robotoBlack(size: 17)
//        appearance.dangerButton.font = robotoMedium(size: 17)
//        appearance.cancelButton.font = robotoMedium(size: 17)
    }
}
