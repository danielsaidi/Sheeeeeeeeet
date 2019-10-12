//
//  ActionSheetSelectItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetSelectItemCell: ActionSheetItemCell {
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var selectedIcon: UIImage?
    @objc public dynamic var selectedIconColor: UIColor?
    @objc public dynamic var selectedSubtitleColor: UIColor?
    @objc public dynamic var selectedSubtitleFont: UIFont?
    @objc public dynamic var selectedTitleColor: UIColor?
    @objc public dynamic var selectedTitleFont: UIFont?
    @objc public dynamic var selectedTintColor: UIColor?
    @objc public dynamic var unselectedIcon: UIImage?
    @objc public dynamic var unselectedIconColor: UIColor?
    
    
    // MARK: - Functions
    
    open override func refresh() {
        super.refresh()
        guard let item = item as? SelectItem else { return }
        applyAccessibility(for: item)
        applyAccessoryView(for: item)
        applyAccessoryViewColor(for: item)
        applySubtitleColor(for: item)
        applySubtitleFont(for: item)
        applyTintColor(for: item)
        applyTitleColor(for: item)
        applyTitleFont(for: item)
    }
}


private extension ActionSheetSelectItemCell {
    
    func applyAccessibility(for item: SelectItem) {
        if item.isSelected {
            accessibilityTraits.insert(.selected)
        } else {
            accessibilityTraits.remove(.selected)
        }
    }

    func applyAccessoryView(for item: SelectItem) {
        guard let image = item.isSelected ? selectedIcon : unselectedIcon else { return }
        accessoryView = UIImageView(image: image)
    }
    
    func applyAccessoryViewColor(for item: SelectItem) {
        guard let color = item.isSelected ? selectedIconColor : unselectedIconColor else { return }
        accessoryView?.tintColor = color
    }
    
    func applySubtitleColor(for item: SelectItem) {
        guard item.isEnabled else { return }
        guard let color = item.isSelected ? selectedSubtitleColor : subtitleColor else { return }
        detailTextLabel?.textColor = color
    }
    
    func applySubtitleFont(for item: SelectItem) {
        guard let font = item.isSelected ? selectedSubtitleFont : subtitleFont else { return }
        detailTextLabel?.font = font
    }
    
    func applyTintColor(for item: SelectItem) {
        let defaultTint = type(of: self).appearance().tintColor
        guard let color = item.isSelected ? selectedTintColor : defaultTint else { return }
        tintColor = color
    }
    
    func applyTitleColor(for item: SelectItem) {
        guard item.isEnabled else { return }
        guard let color = item.isSelected ? selectedTitleColor : titleColor else { return }
        textLabel?.textColor = color
    }
    
    func applyTitleFont(for item: SelectItem) {
        guard let font = item.isSelected ? selectedTitleFont : titleFont else { return }
        textLabel?.font = font
    }
}
