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
 This is the base class for all action sheet appearances.

 Just call `ActionSheet.applyAppearance(.standard)` to apply
 the standard appearance.
 
 You can inherit this class to create your own custom action
 sheet appearances. However, to avoid a lot of work, you can
 inherit `StandardActionSheetAppearance` instead and add any
 customizations to the standard appearance.
 
 To apply a custom appearance, simply call the same function
 as before, with your custom appearance as parameter instead
 of `.standard`.
 */
open class ActionSheetAppearance {

    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Properties
    
    /**
     Get an instance of the standard action sheet appearance.
     */
    public static var standard: ActionSheetAppearance {
        ActionSheetAppearance()
    }
    
    /**
     The currently applied, global action sheet appearance.
     */
    public static var global: ActionSheetAppearance?

    
    /**
     Apply the appearance to be used globally for all sheets.
     */
    open func apply() {
        ActionSheetAppearance.global = self
        applyColors()
        applyCornerRadii()
        applyFonts()
        applyHeights()
        applyIcons()
        applySeparatorInsets()
        applyTextAlignments()
    }
    
    /**
     Apply action sheet view and item colors.
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
        item.disabledTitleColor = .sheetColor(.disabledText)
        item.disabledSubtitleColor = .sheetColor(.disabledText)
        item.disabledTintColor = .sheetColor(.disabledText)
        
        destructiveItem.tintColor = .sheetColor(.danger)
        destructiveItem.titleColor = .sheetColor(.danger)
        destructiveItem.subtitleColor = .sheetColor(.danger)
        
        selectItem.selectedIconColor = .sheetColor(.text)
        selectItem.selectedTintColor = .sheetColor(.text)
        selectItem.selectedTitleColor = .sheetColor(.text)
        selectItem.selectedSubtitleColor = .sheetColor(.text)
        selectItem.tintColor = .sheetColor(.discreteText)
        selectItem.titleColor = .sheetColor(.discreteText)
        selectItem.subtitleColor = .sheetColor(.discreteText)
        selectItem.unselectedIconColor = .sheetColor(.discreteText)
        multiSelectToggle.selectAllSubtitleColor = .sheetColor(.actionText)
        multiSelectToggle.deselectAllSubtitleColor = .sheetColor(.actionText)

        secondaryAction.secondaryActionIconColor = .sheetColor(.text)
        
        cancelButton.titleColor = .sheetColor(.discreteText)
        destructiveButton.titleColor = .sheetColor(.danger)
    }
    
    /**
     Apply action sheet views corner radii.
    */
    open func applyCornerRadii() {
        header.cornerRadius = 10
        table.cornerRadius = 10
    }
    
    /**
     Apply action sheet item fonts and font sizes.
    */
    open func applyFonts() {
        item.titleFont = .systemFont(ofSize: 17)
        item.subtitleFont = .systemFont(ofSize: 14)
        multiSelectToggle.titleFont = .boldSystemFont(ofSize: 13)
        sectionTitle.titleFont = .boldSystemFont(ofSize: 14)
        title.titleFont = .boldSystemFont(ofSize: 15)
        button.titleFont = .boldSystemFont(ofSize: 17)
        cancelButton.titleFont = .systemFont(ofSize: 17)
    }
    
    /**
     Apply action sheet item cell heights.
     */
    open func applyHeights() {
        ActionSheetItemCell.appearance().height = 50
        ActionSheetSectionTitleCell.appearance().height = 25
        ActionSheetSectionMarginCell.appearance().height = 20
    }
    
    /**
     Apply action sheet item icons.
    */
    open func applyIcons() {
        guard #available(iOS 13.0, *) else { return }
        link.linkIcon = UIImage(systemName: "chevron.right")
        selectItem.selectedIcon = UIImage(systemName: "checkmark")
    }
    
    /**
     Apply action sheet separator insets.
    */
    open func applySeparatorInsets() {
        item.separatorInset = .zero
        title.separatorInset = .hiddenSeparator
        sectionTitle.separatorInset = .hiddenSeparator
        sectionMargin.separatorInset = .hiddenSeparator
        multiSelectToggle.separatorInset = .hiddenSeparator
    }
    
    /**
     Apply action sheet text alignments.
    */
    open func applyTextAlignments() {
        item.itemTextAlignment = .left
        button.itemTextAlignment = .center
        title.itemTextAlignment = .center
        sectionTitle.itemTextAlignment = .left
    }
}


// MARK: - Appearance Utility Properties

public extension ActionSheetAppearance {
    
    var background: ActionSheetBackgroundView { ActionSheetBackgroundView.appearance() }
    
    var header: ActionSheetHeaderContainerView { ActionSheetHeaderContainerView.appearance() }
    
    var table: ActionSheetTableView { ActionSheetTableView.appearance() }
    var itemsTable: ActionSheetItemTableView { ActionSheetItemTableView.appearance() }
    var buttonsTable: ActionSheetButtonTableView { ActionSheetButtonTableView.appearance() }
    
    var item: ActionSheetItemCell { ActionSheetItemCell.appearance() }
    
    var button: ActionSheetButtonCell { ActionSheetButtonCell.appearance() }
    var cancelButton: ActionSheetCancelButtonCell { ActionSheetCancelButtonCell.appearance() }
    var destructiveButton: ActionSheetDestructiveButtonCell { ActionSheetDestructiveButtonCell.appearance() }
    
    var destructiveItem: ActionSheetDestructiveItemCell { ActionSheetDestructiveItemCell.appearance() }
    var link: ActionSheetLinkItemCell { ActionSheetLinkItemCell.appearance() }
    var multiSelectItem: ActionSheetMultiSelectItemCell { ActionSheetMultiSelectItemCell.appearance() }
    var multiSelectToggle: ActionSheetMultiSelectToggleItemCell { ActionSheetMultiSelectToggleItemCell.appearance() }
    var okButton: ActionSheetOkButtonCell { ActionSheetOkButtonCell.appearance() }
    var secondaryAction: ActionSheetSecondaryActionItemCell { ActionSheetSecondaryActionItemCell.appearance() }
    var selectItem: ActionSheetSelectItemCell { ActionSheetSelectItemCell.appearance() }
    var singleSelectItem: ActionSheetSingleSelectItemCell { ActionSheetSingleSelectItemCell.appearance() }
    
    var title: ActionSheetTitleCell { ActionSheetTitleCell.appearance() }
    var sectionMargin: ActionSheetSectionMarginCell { ActionSheetSectionMarginCell.appearance() }
    var sectionTitle: ActionSheetSectionTitleCell { ActionSheetSectionTitleCell.appearance() }
}
