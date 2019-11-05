//
//  SecondaryActionItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-11-01.
//

import Foundation
import UIKit

/**
 A `SecondaryActionItem` can be used when a menu item should
 have a secondary action besides the menu's main item select
 action, that is triggered when an item is selected.
 */
open class SecondaryActionItem: MenuItem {
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        value: Any? = nil,
        image: UIImage? = nil,
        isEnabled: Bool = true,
        tapBehavior: TapBehavior = .dismiss,
        secondaryAction: @escaping Menu.ItemAction) {
        self.secondaryAction = secondaryAction
        super.init(
            title: title,
            subtitle: subtitle,
            value: value,
            image: image,
            isEnabled: isEnabled,
            tapBehavior: tapBehavior
        )
    }
    
    public let secondaryAction: Menu.ItemAction
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }
}
