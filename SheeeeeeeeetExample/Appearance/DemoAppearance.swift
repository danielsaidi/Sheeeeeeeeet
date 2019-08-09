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

class DemoAppearance {
    
    static func applyStandardAppearance() {
        ActionSheet.applyStandardAppearance()
//        applyFonts()
//        applyHeights()
        applyIcons()
        applyPopoverWidth()
    }
    
    static func applyCrazyAppearance() {
        applyStandardAppearance()
        applyCrazyColors()
        applyCrazyFonts()
        applyCrazyHeights()
    }
    
    static func applyCrazyColors() {
        background.backgroundColor = .purple
        item.subtitleColor = .exampleBlue
        selectItem.selectedTintColor = .exampleBlue
        selectItem.selectedTitleColor = .exampleGreen
        selectItem.selectedIconColor = .examplePurple
        singleSelectItem.selectedTintColor = .exampleGreen
        singleSelectItem.selectedTitleColor = .examplePurple
        singleSelectItem.selectedIconColor = .exampleBlue
        table.separatorColor = .purple
        ActionSheetTableView.appearance(whenContainedInInstancesOf: [MultiSelectActionSheet.self]).cornerRadius = 30
    }
    
    static func applyCrazyFonts() {
        item.titleFont = .robotoRegular(size: 17)
        item.subtitleFont = .robotoRegular(size: 14)
        link.titleFont = .robotoRegular(size: 17)
        multiSelectToggle.titleFont = .robotoMedium(size: 13)
        sectionTitle.titleFont = .robotoMedium(size: 14)
        title.titleFont = .robotoMedium(size: 15)
        okButton.titleFont = .robotoMedium(size: 17)
        dangerButton.titleFont = .robotoMedium(size: 17)
        cancelButton.titleFont = .robotoRegular(size: 17)
    }
    
    static func applyCrazyHeights() {
        ActionSheetSectionTitle.height = 20
        ActionSheetSectionMargin.height = 20
    }
}

private extension DemoAppearance {
    
    static var background: ActionSheetBackgroundView { ActionSheetBackgroundView.appearance() }
    static var buttonsTable: ActionSheetButtonTableView { ActionSheetButtonTableView.appearance() }
    static var cancelButton: ActionSheetCancelButtonCell { ActionSheetCancelButtonCell.appearance() }
    static var dangerButton: ActionSheetDangerButtonCell { ActionSheetDangerButtonCell.appearance() }
    static var header: ActionSheetHeaderView { ActionSheetHeaderView.appearance() }
    static var link: ActionSheetLinkItemCell { ActionSheetLinkItemCell.appearance() }
    static var item: ActionSheetItemCell { ActionSheetItemCell.appearance() }
    static var itemsTable: ActionSheetItemTableView { ActionSheetItemTableView.appearance() }
    static var multiSelectItem: ActionSheetMultiSelectItemCell { ActionSheetMultiSelectItemCell.appearance() }
    static var multiSelectToggle: ActionSheetMultiSelectToggleItemCell { ActionSheetMultiSelectToggleItemCell.appearance() }
    static var okButton: ActionSheetOkButtonCell { ActionSheetOkButtonCell.appearance() }
    static var sectionMargin: ActionSheetSectionMarginCell { ActionSheetSectionMarginCell.appearance() }
    static var sectionTitle: ActionSheetSectionTitleCell { ActionSheetSectionTitleCell.appearance() }
    static var selectItem: ActionSheetSelectItemCell { ActionSheetSelectItemCell.appearance() }
    static var singleSelectItem: ActionSheetSingleSelectItemCell { ActionSheetSingleSelectItemCell.appearance() }
    static var table: ActionSheetTableView { ActionSheetTableView.appearance() }
    static var title: ActionSheetTitleCell { ActionSheetTitleCell.appearance() }
    
    static func applyIcons() {
        if #available(iOS 13.0, *) { return }
        link.linkIcon = UIImage(named: "ic_arrow_right")
        selectItem.selectedIcon = UIImage(named: "ic_checkmark")
        selectItem.unselectedIcon = UIImage(named: "ic_empty")
    }
    
    static func applyPopoverWidth() {
//        ActionSheet.preferredPopoverWidth = 700
    }
}
