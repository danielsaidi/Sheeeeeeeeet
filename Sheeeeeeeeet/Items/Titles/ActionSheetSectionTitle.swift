//
//  ActionSheetSectionTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Section title items can be used to segment action sheets in
 sections. They serve no purpose beyond to visually indicate
 that certain items belong together.
 
 To add additional space above a section title, make sure to
 add a `ActionSheetSectionMargin` before the section title.
 */
open class ActionSheetSectionTitle: ActionSheetItem {
    
    public init(title: String, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle, tapBehavior: .none)
    }
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetSectionTitleCell(style: cellStyle, reuseIdentifier: cellReuseIdentifier)
    }
}

open class ActionSheetSectionTitleCell: ActionSheetItemCell {}
