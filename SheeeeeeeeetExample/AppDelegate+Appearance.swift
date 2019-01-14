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
        applyViewAppearances()
        applyColors()
        applyFonts()
        applyHeights()
        applyIcons()
        applySelectItemAppearances()
        applySeparatorInsets()
        applyPopoverWidth()
        applyLegacyAppearance()
    }
}


private extension AppDelegate {
    
    func applyViewAppearances() {
//        ActionSheetBackgroundView.appearance().backgroundColor = .purple
        ActionSheetHeaderView.appearance().cornerRadius = 10
        ActionSheetTableView.appearance().cornerRadius = 10
//        ActionSheetTableView.appearance().separatorLineColor = .purple
//        ActionSheetItemTableView.appearance().cornerRadius = 20
//        ActionSheetTableView.appearance(whenContainedInInstancesOf: [MultiSelectActionSheet.self]).cornerRadius = 20
    }
    
    func applyColors() {
        ActionSheetItemCell.appearance().titleColor = .darkText
        ActionSheetItemCell.appearance().subtitleColor = .exampleBlue
        ActionSheetItemCell.appearance().tintColor = .darkText
//        ActionSheetItemCell.appearance().separatorColor = .red
//        ActionSheetItemCell.appearance().backgroundColor = red
//        ActionSheetItemCell.appearance(whenContainedInInstancesOf: [ActionSheetItemTableView.self]).backgroundColor = .purple
        ActionSheetOkButtonCell.appearance().titleColor = .darkGray
        ActionSheetCancelButtonCell.appearance().titleColor = .lightGray
        ActionSheetDangerButtonCell.appearance().titleColor = .examplePink
    }
    
    func applyFonts() {
        ActionSheetItemCell.appearance().titleFont = .robotoRegular(size: 17)
        ActionSheetItemCell.appearance().subtitleFont = .robotoRegular(size: 14)
        ActionSheetLinkItemCell.appearance().titleFont = .robotoRegular(size: 17)
        ActionSheetMultiSelectToggleItemCell.appearance().titleFont = .robotoMedium(size: 13)
        ActionSheetSectionTitleCell.appearance().titleFont = .robotoMedium(size: 13)
        ActionSheetTitleCell.appearance().titleFont = .robotoMedium(size: 15)
        ActionSheetOkButtonCell.appearance().titleFont = .robotoBlack(size: 17)
        ActionSheetDangerButtonCell.appearance().titleFont = .robotoMedium(size: 17)
        ActionSheetCancelButtonCell.appearance().titleFont = .robotoRegular(size: 17)
    }
    
    func applyHeights() {
        ActionSheetSectionTitle.height = 20
        ActionSheetSectionMargin.height = 20
    }
    
    func applyIcons() {
        ActionSheetLinkItemCell.appearance().linkIcon = UIImage(named: "ic_arrow_right")
    }
    
    func applySelectItemAppearances() {
        ActionSheetSelectItemCell.appearance().selectedIcon = UIImage(named: "ic_checkmark")
        ActionSheetSelectItemCell.appearance().unselectedIcon = UIImage(named: "ic_empty")
        ActionSheetSelectItemCell.appearance().selectedTintColor = .exampleBlue
        ActionSheetSelectItemCell.appearance().selectedTitleColor = .exampleGreen
        ActionSheetSelectItemCell.appearance().selectedIconColor = .examplePurple
        
        ActionSheetSingleSelectItemCell.appearance().selectedTintColor = .exampleGreen
        ActionSheetSingleSelectItemCell.appearance().selectedTitleColor = .examplePurple
        ActionSheetSingleSelectItemCell.appearance().selectedIconColor = .exampleBlue
        
        ActionSheetMultiSelectItemCell.appearance().selectedTintColor = .examplePurple
        ActionSheetMultiSelectItemCell.appearance().selectedTitleColor = .exampleBlue
        ActionSheetMultiSelectItemCell.appearance().selectedIconColor = .exampleGreen
        
        ActionSheetMultiSelectToggleItemCell.appearance().selectAllSubtitleColor = .lightGray
        ActionSheetMultiSelectToggleItemCell.appearance().deselectAllSubtitleColor = .exampleRed
    }
    
    func applySeparatorInsets() {
        ActionSheetItemCell.appearance().separatorInset = .zero
        ActionSheetTitleCell.appearance().separatorInset = .hiddenSeparator
        ActionSheetSectionTitleCell.appearance().separatorInset = .hiddenSeparator
        ActionSheetSectionMarginCell.appearance().separatorInset = .hiddenSeparator
        ActionSheetMultiSelectToggleItemCell.appearance().separatorInset = .hiddenSeparator
    }
    
    func applyPopoverWidth() {
//        ActionSheet.preferredPopoverWidth = 700
    }
}


// MARK: - Legacy

private extension AppDelegate {
    
    func applyLegacyAppearance() {
        applyLegacyColors()
        applyLegacyFonts()
        applyLegacyHeights()
        applyLegacyLinkIcon()
        applyLegacyMultiSelectItemToggleAppearances()
        applyLegacyPopoverWidth()
        applyLegacySelectItemAppearances()
        applyLegacySeparatorInsets()
        applyLegacySubtitleFonts()
        applyLegacySubtitleTextColor()
        applyLegacyTextColors()
        applyLegacyTintColors()
    }
    
    func applyLegacyColors() {
//        ActionSheetAppearance.standard.item.backgroundColor = .exampleRed
//        ActionSheetAppearance.standard.separatorColor = .exampleRed
    }
    
    func applyLegacyFonts() {
//        ActionSheetAppearance.standard.item.font = robotoRegular(size: 170)
//        ActionSheetAppearance.standard.linkItem.font = robotoRegular(size: 170)
//        ActionSheetAppearance.standard.title.font = robotoMedium(size: 15)
//        ActionSheetAppearance.standard.sectionTitle.font = robotoMedium(size: 13)
//        ActionSheetAppearance.standard.multiSelectToggleItem.font = robotoMedium(size: 13)
//        ActionSheetAppearance.standard.okButton.font = robotoBlack(size: 17)
//        ActionSheetAppearance.standard.dangerButton.font = robotoMedium(size: 17)
//        ActionSheetAppearance.standard.cancelButton.font = robotoMedium(size: 17)
    }
    
    func applyLegacyHeights() {
//        ActionSheetAppearance.standard.sectionTitle.height = 20
//        ActionSheetAppearance.standard.sectionMargin.height = 20
    }
    
    func applyLegacyLinkIcon() {
//        ActionSheetAppearance.standard.linkItem.linkIcon = UIImage(named: "ic_arrow_right")
    }
    
    func applyLegacyMultiSelectItemToggleAppearances() {
//        ActionSheetAppearance.standard.linkItem.linkIcon = UIImage(named: "ic_arrow_right")
    }
    
    func applyLegacyPopoverWidth() {
//        ActionSheetAppearance.standard.popover.width = 800
    }
    
    func applyLegacySelectItemAppearances() {
//        ActionSheetAppearance.standard.selectItem.selectedIcon = UIImage(named: "ic_checkmark")
//        ActionSheetAppearance.standard.selectItem.unselectedIcon = UIImage(named: "ic_empty")
//        ActionSheetAppearance.standard.selectItem.selectedTintColor = .exampleBlue
//        ActionSheetAppearance.standard.selectItem.selectedTextColor = .exampleGreen
//        ActionSheetAppearance.standard.selectItem.selectedIconTintColor = .examplePurple
//
//        ActionSheetAppearance.standard.singleSelectItem.selectedTintColor = .exampleGreen
//        ActionSheetAppearance.standard.singleSelectItem.selectedTextColor = .examplePurple
//        ActionSheetAppearance.standard.singleSelectItem.selectedIconTintColor = .exampleBlue
//
//        ActionSheetAppearance.standard.multiSelectItem.selectedTintColor = .examplePurple
//        ActionSheetAppearance.standard.multiSelectItem.selectedTextColor = .exampleBlue
//        ActionSheetAppearance.standard.multiSelectItem.selectedIconTintColor = .exampleGreen
    }
    
    func applyLegacySeparatorInsets() {
//        ActionSheetAppearance.standard.item.separatorInsets = .zero
//        ActionSheetAppearance.standard.title.hideSeparator()
//        ActionSheetAppearance.standard.sectionTitle.hideSeparator()
//        ActionSheetAppearance.standard.multiSelectToggleItem.hideSeparator()
    }
    
    func applyLegacySubtitleFonts() {
//        ActionSheetAppearance.standard.item.subtitleFont = robotoRegular(size: 170)
    }
    
    func applyLegacySubtitleTextColor() {
//        ActionSheetAppearance.standard.item.subtitleTextColor = .purple
    }
    
    func applyLegacyTextColors() {
//        ActionSheetAppearance.standard.item.textColor = .purple
//        ActionSheetAppearance.standard.okButton.textColor = .darkGray
//        ActionSheetAppearance.standard.dangerButton.textColor = .examplePink
//        ActionSheetAppearance.standard.cancelButton.textColor = .lightGray
    }
    
    func applyLegacyTintColors() {
//        ActionSheetAppearance.standard.item.tintColor = .purple
    }
}
