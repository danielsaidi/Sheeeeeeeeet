//
//  ActionSheet+LegacyAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ActionSheet {

    func applyLegacyAppearance() {
        applyLegacyHeights()
        applyLegacyBackgroundColors()
        applyLegacyContentInsets()
        applyLegacyCornerRadius()
        applyLegacyGroupMargins()
        applyLegacyPopoverWidth()
        applyLegacySeparatorColors()
    }
}

private extension ActionSheet {
    
    func applyLegacyBackgroundColors() {
        if let color = appearance.backgroundColor { itemsTableView?.backgroundColor = color }
        if let color = appearance.backgroundColor { buttonsTableView?.backgroundColor = color }
        if let color = appearance.itemsBackgroundColor { itemsTableView?.backgroundColor = color }
        if let color = appearance.buttonsBackgroundColor { buttonsTableView?.backgroundColor = color }
    }
    
    func applyLegacyContentInsets() {
        guard let inset = appearance.contentInset else { return }
        minimumContentInsets.top = inset
        minimumContentInsets.left = inset
        minimumContentInsets.right = inset
        minimumContentInsets.bottom = inset
    }
    
    func applyLegacyCornerRadius() {
        guard let radius = appearance.cornerRadius else { return }
        headerViewContainer?.cornerRadius = radius
        itemsTableView?.cornerRadius = radius
        buttonsTableView?.cornerRadius = radius
    }
    
    func applyLegacyGroupMargins() {
        guard let margins = appearance.groupMargins else { return }
        sectionMargins = margins
    }
    
    func applyLegacyHeights() {
        let appearance = ActionSheetAppearance.standard
        if let height = appearance.item.height { ActionSheetItem.height = height }
        if let height = appearance.cancelButton.height { ActionSheetCancelButton.height = height }
        if let height = appearance.dangerButton.height { ActionSheetDangerButton.height = height }
        if let height = appearance.okButton.height { ActionSheetOkButton.height = height }
        if let height = appearance.linkItem.height { ActionSheetLinkItem.height = height }
        if let height = appearance.multiSelectItem.height { ActionSheetMultiSelectItem.height = height }
        if let height = appearance.multiSelectToggleItem.height { ActionSheetMultiSelectToggleItem.height = height }
        if let height = appearance.selectItem.height { ActionSheetSelectItem.height = height }
        if let height = appearance.sectionTitle.height { ActionSheetSectionTitle.height = height }
        if let height = appearance.sectionMargin.height { ActionSheetSectionMargin.height = height }
        if let height = appearance.title.height { ActionSheetTitle.height = height }
    }
    
    func applyLegacyPopoverWidth() {
        guard let width = appearance.popover.width else { return }
        preferredContentSize.width = width
    }
    
    func applyLegacySeparatorColors() {
        if let color = appearance.separatorColor { itemsTableView?.separatorLineColor = color }
        if let color = appearance.separatorColor { buttonsTableView?.separatorLineColor = color }
        if let color = appearance.itemsSeparatorColor { itemsTableView?.separatorLineColor = color }
        if let color = appearance.buttonsSeparatorColor { buttonsTableView?.separatorLineColor = color }
    }
}
