//
//  ActionSheet+Appearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheet {

    /**
     Applies the standard action sheet appearance, using the
     semantic `ActionSheetColor` colors, rounded corners etc.
     
     You should always call this function to ensure that the
     sheets in your app look and behave as intended, even if
     you want to apply your own customizations. You can then
     apply any customizations after calling this function.
     */
    static func applyStandardAppearance() {
        applyColors()
        applyCornerRadii()
        applyFonts()
        applyHeights()
        applyIcons()
        applySeparatorInsets()
    }
}


// MARK: - Private Functions

private extension ActionSheet {
    
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
    static var table: ActionSheetTableView { ActionSheetTableView.appearance() }
    static var title: ActionSheetTitleCell { ActionSheetTitleCell.appearance() }
    
    static func applyColors() {
        cancelButton.titleColor = .color(for: .discreteText)
        background.backgroundColor = .color(for: .overlay)
        dangerButton.titleColor = .color(for: .danger)
        header.backgroundColor = .clear
        item.backgroundColor = .color(for: .background)
        item.tintColor = .color(for: .text)
        item.titleColor = .color(for: .text)
        item.subtitleColor = .color(for: .text)
        selectItem.selectedIconColor = .color(for: .text)
        selectItem.selectedTintColor = .color(for: .text)
        selectItem.selectedTitleColor = .color(for: .text)
        multiSelectItem.tintColor = .color(for: .discreteText)
        multiSelectItem.titleColor = .color(for: .discreteText)
        multiSelectItem.unselectedIconColor = .color(for: .discreteText)
        multiSelectToggle.selectAllSubtitleColor = .color(for: .actionText)
        multiSelectToggle.deselectAllSubtitleColor = .color(for: .actionText)
        table.backgroundColor = .color(for: .background)
        table.separatorColor = .color(for: .separator)
        
        itemsTable.backgroundColor = .color(for: .background)
        buttonsTable.backgroundColor = .color(for: .background)
    }
    
    static func applyCornerRadii() {
        header.cornerRadius = 10
        table.cornerRadius = 10
    }
    
    static func applyFonts() {
        item.titleFont = .systemFont(ofSize: 17)
        item.subtitleFont = .systemFont(ofSize: 14)
        link.titleFont = .systemFont(ofSize: 17)
        multiSelectToggle.titleFont = .boldSystemFont(ofSize: 13)
        sectionTitle.titleFont = .boldSystemFont(ofSize: 14)
        title.titleFont = .boldSystemFont(ofSize: 15)
        okButton.titleFont = .boldSystemFont(ofSize: 17)
        dangerButton.titleFont = .boldSystemFont(ofSize: 17)
        cancelButton.titleFont = .systemFont(ofSize: 17)
    }
    
    static func applyHeights() {
        ActionSheetSectionTitle.height = 25
        ActionSheetSectionMargin.height = 25
    }
    
    static func applyIcons() {
        guard #available(iOS 13.0, *) else { return }
        link.linkIcon = UIImage(systemName: "chevron.right")
        selectItem.selectedIcon = UIImage(systemName: "checkmark")
    }
    
    static func applySeparatorInsets() {
        item.separatorInset = .zero
        title.separatorInset = .hiddenSeparator
        sectionTitle.separatorInset = .hiddenSeparator
        sectionMargin.separatorInset = .hiddenSeparator
        multiSelectToggle.separatorInset = .hiddenSeparator
    }
}
