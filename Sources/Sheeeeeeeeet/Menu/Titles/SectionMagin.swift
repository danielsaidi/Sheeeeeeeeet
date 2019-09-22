//
//  SectionMargin.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Section margins items can be used to add additional spacing
 before or after new sections.
 */
open class SectionMargin: MenuTitle {
    
    
    // MARK - Initialization
    
    public init() {
        super.init(title: "")
    }

    
    // MARK: - ActionSheet
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetSectionMarginCell(style: cellStyle)
    }
}
