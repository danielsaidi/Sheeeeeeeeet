//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import UIKit

/**
 This is the base class for all action sheet appearances. It
 applies a standard appearance to all action sheets.
 
 This appearance uses semantic `ActionSheetColor` colors and
 also applies standard values for rounded corners, icons etc.
 It applies SF Symbols where applicable if a device runs iOS
 13, but does nothing if it runs iOS 12 or earlier.
 
 You can inherit this class to customize the standard action
 sheet appearance. To apply your custom appearance, just use
 `ActionSheet.applyAppearance(...)` with your own appearance.
 
 `IMPORTANT` Since this appearance applies certain fonts and
 colors for certain item types, you may have to apply custom
 overrides several times. For instance, if you want to apply
 a custom font for all your items, you must apply it to each
 item type that is affected by this appearance.
 */
open class ActionSheetAppearance {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Standard Appearance
    
    public static var standard: ActionSheetAppearance {
        ActionSheetAppearance()
    }
    
    
    // MARK: - Apply Functions

    /**
     Apply the appearance as a global appearance.
     */
    open func apply() {
        applyColors()
        applyCornerRadii()
        applyFonts()
        applyHeights()
        applyIcons()
        applySeparatorInsets()
    }
    
    /**
     Apply background colors, text colors etc.
     */
    open func applyColors() {
        background.backgroundColor = .sheetColor(.overlay)
        header.backgroundColor = .clear
        table.separatorColor = .sheetColor(.separator)
        table.backgroundColor = .sheetColor(.background)
        
        item.backgroundColor = .clear
        item.tintColor = .sheetColor(.text)
        item.titleColor = .sheetColor(.text)
        item.subtitleColor = .sheetColor(.text)
        
        selectItem.selectedIconColor = .sheetColor(.text)
        selectItem.selectedTintColor = .sheetColor(.text)
        selectItem.selectedTitleColor = .sheetColor(.text)
        selectItem.tintColor = .sheetColor(.discreteText)
        selectItem.titleColor = .sheetColor(.discreteText)
        selectItem.unselectedIconColor = .sheetColor(.discreteText)
        multiSelectToggle.selectAllSubtitleColor = .sheetColor(.actionText)
        multiSelectToggle.deselectAllSubtitleColor = .sheetColor(.actionText)

        cancelButton.titleColor = .sheetColor(.discreteText)
        dangerButton.titleColor = .sheetColor(.danger)
    }
    
    open func applyCornerRadii() {
        header.cornerRadius = 10
        table.cornerRadius = 10
    }
    
    open func applyFonts() {
        item.titleFont = .systemFont(ofSize: 17)
        item.subtitleFont = .systemFont(ofSize: 14)
        multiSelectToggle.titleFont = .boldSystemFont(ofSize: 13)
        sectionTitle.titleFont = .boldSystemFont(ofSize: 14)
        title.titleFont = .boldSystemFont(ofSize: 15)
        button.titleFont = .boldSystemFont(ofSize: 17)
        cancelButton.titleFont = .systemFont(ofSize: 17)
    }
    
    open func applyHeights() {
        ActionSheetSectionTitle.height = 25
        ActionSheetSectionMargin.height = 25
    }
    
    open func applyIcons() {
        guard #available(iOS 13.0, *) else { return }
        link.linkIcon = UIImage(systemName: "chevron.right")
        selectItem.selectedIcon = UIImage(systemName: "checkmark")
    }
    
    open func applySeparatorInsets() {
        item.separatorInset = .zero
        title.separatorInset = .hiddenSeparator
        sectionTitle.separatorInset = .hiddenSeparator
        sectionMargin.separatorInset = .hiddenSeparator
        multiSelectToggle.separatorInset = .hiddenSeparator
    }
}


// MARK - Shorthand Properties

public extension ActionSheetAppearance {
    
    var background: ActionSheetBackgroundView { ActionSheetBackgroundView.appearance() }
    var button: ActionSheetButtonCell { ActionSheetButtonCell.appearance() }
    var buttonsTable: ActionSheetButtonTableView { ActionSheetButtonTableView.appearance() }
    var cancelButton: ActionSheetCancelButtonCell { ActionSheetCancelButtonCell.appearance() }
    var dangerButton: ActionSheetDangerButtonCell { ActionSheetDangerButtonCell.appearance() }
    var header: ActionSheetHeaderContainerView { ActionSheetHeaderContainerView.appearance() }
    var link: ActionSheetLinkItemCell { ActionSheetLinkItemCell.appearance() }
    var item: ActionSheetItemCell { ActionSheetItemCell.appearance() }
    var itemsTable: ActionSheetItemTableView { ActionSheetItemTableView.appearance() }
    var multiSelectItem: ActionSheetMultiSelectItemCell { ActionSheetMultiSelectItemCell.appearance() }
    var multiSelectToggle: ActionSheetMultiSelectToggleItemCell { ActionSheetMultiSelectToggleItemCell.appearance() }
    var okButton: ActionSheetOkButtonCell { ActionSheetOkButtonCell.appearance() }
    var sectionMargin: ActionSheetSectionMarginCell { ActionSheetSectionMarginCell.appearance() }
    var sectionTitle: ActionSheetSectionTitleCell { ActionSheetSectionTitleCell.appearance() }
    var selectItem: ActionSheetSelectItemCell { ActionSheetSelectItemCell.appearance() }
    var singleSelectItem: ActionSheetSingleSelectItemCell { ActionSheetSingleSelectItemCell.appearance() }
    var table: ActionSheetTableView { ActionSheetTableView.appearance() }
    var title: ActionSheetTitleCell { ActionSheetTitleCell.appearance() }
}
