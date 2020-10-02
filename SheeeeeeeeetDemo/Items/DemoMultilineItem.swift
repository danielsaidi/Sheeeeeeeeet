//
//  DemoMultilineItem.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2020-10-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

/**
 This is a custom, demo-specific item type that demonstrates
 how to create custom item types with custom cells. The item
 will render itself in a `DemoMultilineItemCell`
 */
class DemoMultilineItem: MenuItem {

    override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        DemoMultilineItemCell(style: actionSheetCellStyle)
    }
    
    override var actionSheetCellType: ActionSheetItemCell.Type {
        DemoMultilineItemCell.self
    }
}

/**
 This cell is used to present a `DemoMultilineItem`. The app
 theme applies a taller height for this cell, since the text
 will multiply and wrap over many lines.
 */
open class DemoMultilineItemCell: ActionSheetItemCell {
    
    open override func refresh() {
        super.refresh()
        let text = textLabel?.text ?? ""
        textLabel?.numberOfLines = 0
        textLabel?.text = (0...2)
            .map { _ in text }
            .joined(separator: " ")
    }
}
