//
//  StandardActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This is the standard action sheet appearance, which is used
 by the library by default.
 
 This appearance uses the semantic `ActionSheetColor` colors
 and also applies standard values for rounded corners, icons
 etc. It uses SF Symbols for iOS 13, but does nothing if the
 device runs iOS 12 or earlier.
 */
open class StandardActionSheetAppearance: ActionSheetAppearance {

    open override func apply() {
        applyColors()
        applyCornerRadii()
        applyFonts()
        applyHeights()
        applyIcons()
        applySeparatorInsets()
    }
    
    open func applyColors() {
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
        singleSelectItem.selectedIconColor = .color(for: .text)
        singleSelectItem.selectedTintColor = .color(for: .text)
        singleSelectItem.selectedTitleColor = .color(for: .text)
        singleSelectItem.tintColor = .color(for: .discreteText)
        singleSelectItem.titleColor = .color(for: .discreteText)
        singleSelectItem.unselectedIconColor = .color(for: .discreteText)
        multiSelectItem.selectedIconColor = .color(for: .text)
        multiSelectItem.selectedTintColor = .color(for: .text)
        multiSelectItem.selectedTitleColor = .color(for: .text)
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
    
    open func applyCornerRadii() {
        header.cornerRadius = 10
        table.cornerRadius = 10
    }
    
    open func applyFonts() {
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
