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
        applyItemBackgroundColors()
        applyItemSubtitleColors()
        applyItemSubtitleFonts()
        applyItemTitleColors()
        applyItemTitleFonts()
        applyItemTintColors()
        
//        appearance.popover.width = 500
        
//        appearance.separatorColor = .red
//        appearance.itemsSeparatorColor = .blue
//        appearance.buttonsSeparatorColor = .green
        
        appearance.title.hideSeparator()
        
        appearance.sectionTitle.hideSeparator()
        appearance.sectionTitle.height = 20
        
        appearance.sectionMargin.height = 20
        
        appearance.selectItem.selectedIcon = UIImage(named: "ic_checkmark")
        appearance.selectItem.unselectedIcon = UIImage(named: "ic_empty")
        appearance.selectItem.selectedTintColor = .exampleBlue
        appearance.selectItem.selectedTextColor = .exampleGreen
        appearance.selectItem.selectedIconTintColor = .examplePurple
        
        appearance.singleSelectItem.selectedTintColor = .exampleGreen
        appearance.singleSelectItem.selectedTextColor = .examplePurple
        appearance.singleSelectItem.selectedIconTintColor = .exampleBlue
        
        appearance.multiSelectItem.selectedTintColor = .examplePurple
        appearance.multiSelectItem.selectedTextColor = .exampleBlue
        appearance.multiSelectItem.selectedIconTintColor = .exampleGreen
        
        appearance.multiSelectToggleItem.hideSeparator()
        appearance.multiSelectToggleItem.selectAllTextColor = .lightGray
        appearance.multiSelectToggleItem.deselectAllTextColor = .exampleRed
        
        appearance.linkItem.linkIcon = UIImage(named: "ic_arrow_right")
        
        applyLegacyAppearance(appearance)
    }
}


private extension AppDelegate {
    
    func applyCornerRadius() {
        ActionSheetHeaderView.appearance().cornerRadius = 10
        ActionSheetTableView.appearance().cornerRadius = 10
        //ActionSheetTableView.appearance(whenContainedInInstancesOf: [MultiSelectActionSheet.self]).cornerRadius = 20
    }
    
    func applyItemBackgroundColors() {
        //ActionSheetItemCell.appearance().backgroundColor = red
    }
    
    func applyItemSubtitleColors() {
        ActionSheetItemCell.appearance().subtitleColor = .exampleBlue
    }
    
    func applyItemSubtitleFonts() {
        ActionSheetItemCell.appearance().subtitleFont = .robotoRegular(size: 14)
    }
    
    func applyItemTintColors() {
        ActionSheetItemCell.appearance().tintColor = .darkText
    }
    
    func applyItemTitleColors() {
        ActionSheetItemCell.appearance().titleColor = .darkText
        ActionSheetOkButtonCell.appearance().titleColor = .darkGray
        ActionSheetCancelButtonCell.appearance().titleColor = .lightGray
        ActionSheetDangerButtonCell.appearance().titleColor = .examplePink
    }
    
    func applyItemTitleFonts() {
        ActionSheetItemCell.appearance().titleFont = .robotoRegular(size: 17)
        ActionSheetLinkItemCell.appearance().titleFont = .robotoRegular(size: 17)
        ActionSheetMultiSelectToggleItemCell.appearance().titleFont = .robotoMedium(size: 13)
        ActionSheetSectionTitleCell.appearance().titleFont = .robotoMedium(size: 13)
        ActionSheetTitleCell.appearance().titleFont = .robotoMedium(size: 15)
        ActionSheetOkButtonCell.appearance().titleFont = .robotoBlack(size: 17)
        ActionSheetDangerButtonCell.appearance().titleFont = .robotoMedium(size: 17)
        ActionSheetCancelButtonCell.appearance().titleFont = .robotoRegular(size: 17)
    }
}


// MARK: - Legacy

private extension AppDelegate {
    
    func applyLegacyAppearance(_ appearance: ActionSheetAppearance) {
        applyLegacyItemBackgroundColors(with: appearance)
        applyLegacyItemFonts(with: appearance)
        applyLegacyItemSubtitleFonts(with: appearance)
        applyLegacyItemSubtitleTextColor(with: appearance)
        applyLegacyItemTextColors(with: appearance)
        applyLegacyItemTintColors(with: appearance)
    }
    
    func applyLegacyItemBackgroundColors(with appearance: ActionSheetAppearance) {
//        appearance.item.backgroundColor = .exampleRed
    }
    
    func applyLegacyItemFonts(with appearance: ActionSheetAppearance) {
//        appearance.item.font = robotoRegular(size: 170)
//        appearance.linkItem.font = robotoRegular(size: 170)
//        appearance.title.font = robotoMedium(size: 15)
//        appearance.sectionTitle.font = robotoMedium(size: 13)
//        appearance.multiSelectToggleItem.font = robotoMedium(size: 13)
//        appearance.okButton.font = robotoBlack(size: 17)
//        appearance.dangerButton.font = robotoMedium(size: 17)
//        appearance.cancelButton.font = robotoMedium(size: 17)
    }
    
    func applyLegacyItemSubtitleFonts(with appearance: ActionSheetAppearance) {
//        appearance.item.subtitleFont = robotoRegular(size: 170)
    }
    
    func applyLegacyItemSubtitleTextColor(with appearance: ActionSheetAppearance) {
//        appearance.item.subtitleTextColor = .purple
    }
    
    func applyLegacyItemTextColors(with appearance: ActionSheetAppearance) {
//        appearance.item.textColor = .purple
//        appearance.okButton.textColor = .darkGray
//        appearance.dangerButton.textColor = .examplePink
//        appearance.cancelButton.textColor = .lightGray
    }
    
    func applyLegacyItemTintColors(with appearance: ActionSheetAppearance) {
//        appearance.item.tintColor = .purple
    }
}
