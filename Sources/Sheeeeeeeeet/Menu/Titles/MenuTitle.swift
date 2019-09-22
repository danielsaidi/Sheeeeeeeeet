//
//  MenuTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Title items can be used to add non-tappable texts to a menu.
 */
open class MenuTitle: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle, tapBehavior: .none)
    }
    
    
    // MARK: - ActionSheet

    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetTitleCell(style: cellStyle)
    }
}
