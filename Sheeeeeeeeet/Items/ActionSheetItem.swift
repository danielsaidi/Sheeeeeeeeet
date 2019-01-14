//
//  ActionSheetItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a regular action sheet item, like the
 ones used in UIAlertController. It has a title, an optional
 value and an optional image. All other items builds on this.
 
 The default tap behavior of action sheet items is "dismiss",
 which means that the action sheet will dismiss itself after
 handling the item tap. Set `tapBehavior` to `.none`, if you
 don't want the action sheet to be dismissed when an item is
 tapped. Some item types uses `.none` by default.
 
 The item appearance is set by the sheet. It either uses the
 global appearance or an individual instance. To use a fully
 custom appearances for a single action sheet item, just set
 the `customAppearance` property.
 
 */

import UIKit

open class ActionSheetItem: NSObject {
    
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        value: Any? = nil,
        image: UIImage? = nil,
        tapBehavior: TapBehavior = .dismiss) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.image = image
        self.tapBehavior = tapBehavior
        super.init()
        if subtitle != nil { self.cellStyle = .value1}
    }
    
    
    // MARK: - Enums
    
    public enum TapBehavior {
        case dismiss, none
    }


    // MARK: - Properties
    
    public var image: UIImage?
    public var subtitle: String?
    public var tapBehavior: TapBehavior
    public var title: String
    public var value: Any?
    
    public var cellReuseIdentifier: String { return className }
    public var cellStyle: UITableViewCell.CellStyle = .default
    
    
    // MARK: - Functions
    
    open func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return ActionSheetItemCell(style: cellStyle, reuseIdentifier: cellReuseIdentifier)
    }
    
    open func handleTap(in actionSheet: ActionSheet) {}
    
    
    // MARK: - Deprecated
    
    @available(*, deprecated, message: "appearance will be removed in 1.4.0. Use the new appearance model instead.")
    public lazy internal(set) var appearance = ActionSheetItemAppearance(copy: ActionSheetAppearance.standard.item)
    
    @available(*, deprecated, message: "customAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    public var customAppearance: ActionSheetItemAppearance?
    
    @available(*, deprecated, message: "applyAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    open func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = customAppearance ?? ActionSheetItemAppearance(copy: appearance.item)
    }
    
    @available(*, deprecated, message: "applyAppearance(to:) will be removed in 1.4.0. Use the new appearance model instead.")
    open func applyAppearance(to cell: UITableViewCell) {
        applyLegacyAppearance(to: cell)
    }
}
