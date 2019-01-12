//
//  ActionSheet+LegacyAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ActionSheet {

    @available(*, deprecated, message: "applyLegacyAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    func applyLegacyAppearance() {
        applyLegacyBackgroundColors()
        applyLegacyContentInsets()
        applyLegacyCornerRadius()
        applyLegacyGroupMargins()
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
    
    func applyLegacySeparatorColors() {
        if let color = appearance.separatorColor { itemsTableView?.separatorLineColor = color }
        if let color = appearance.separatorColor { buttonsTableView?.separatorLineColor = color }
        if let color = appearance.itemsSeparatorColor { itemsTableView?.separatorLineColor = color }
        if let color = appearance.buttonsSeparatorColor { buttonsTableView?.separatorLineColor = color }
    }
}
