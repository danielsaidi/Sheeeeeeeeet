//
//  ActionSheetMultiSelectToggleItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-03-31.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

//  TODO: Unit test

import UIKit

open class ActionSheetMultiSelectToggleItemCell: ActionSheetItemCell {
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var deselectAllImage: UIColor?
    @objc public dynamic var deselectAllSubtitleColor: UIColor?
    @objc public dynamic var deselectAllTitleColor: UIColor?
    @objc public dynamic var selectAllImage: UIColor?
    @objc public dynamic var selectAllSubtitleColor: UIColor?
    @objc public dynamic var selectAllTitleColor: UIColor?
    
    
    // MARK: - Public Functions
    
    open override func refresh() {
        guard let item = item as? MultiSelectToggleItem else { return }
        let isSelectAll = item.state == .selectAll
        item.subtitle = isSelectAll ? item.selectAllTitle : item.deselectAllTitle
        refreshColors(for: item)
        super.refresh()
    }
    
    open func refreshColors(for item: MultiSelectToggleItem) {
        guard item.isEnabled else { return }
        let isSelectAll = item.state == .selectAll
        titleColor = isSelectAll ? selectAllTitleColor : deselectAllTitleColor
        subtitleColor = isSelectAll ? selectAllSubtitleColor : deselectAllSubtitleColor
    }
}
