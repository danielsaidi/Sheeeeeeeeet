//
//  StandardActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheetAppearance {
    
    /**
     Get an instance of the standard action sheet appearance.
     */
    static var standard: ActionSheetAppearance {
        StandardActionSheetAppearance()
    }
}

/**
 This is the standard action sheet appearance, which is used
 by the library by default.
 
 This appearance uses the semantic `ActionSheetColor` colors
 and also applies standard values for rounded corners, icons
 etc. It uses SF Symbols for iOS 13, but does nothing if the
 device runs iOS 12 or earlier.
 
 IMPORTANT: Since this appearance applies specific fonts and
 colors for certain item types, you may have to apply custom
 overrides several times. For instance, if you want to apply
 a custom font for all your items, you must apply it to each
 item type that is affected by this appearance.
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
        background.backgroundColor = .color(for: .overlay)
        header.backgroundColor = .clear
        table.separatorColor = .color(for: .separator)
        
        item.tintColor = .color(for: .text)
        item.titleColor = .color(for: .text)
        item.subtitleColor = .color(for: .text)
        selectItem.selectedIconColor = .color(for: .text)
        selectItem.selectedTintColor = .color(for: .text)
        selectItem.selectedTitleColor = .color(for: .text)
        selectItem.tintColor = .color(for: .discreteText)
        selectItem.titleColor = .color(for: .discreteText)
        selectItem.unselectedIconColor = .color(for: .discreteText)
        multiSelectToggle.selectAllSubtitleColor = .color(for: .actionText)
        multiSelectToggle.deselectAllSubtitleColor = .color(for: .actionText)

        cancelButton.titleColor = .color(for: .discreteText)
        dangerButton.titleColor = .color(for: .danger)
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
