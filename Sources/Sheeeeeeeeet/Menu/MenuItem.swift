//
//  MenuItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class is a base class for all menu items, like buttons,
 items, titles etc.
 
 The base class represents a regular action sheet item, like
 the one used in `UIAlertController`. It has a title as well
 as an optional subtitle, value and image.

 
 ## Subclassing
 
 You can subclass any class in the `MenuItem`, hierarchy and
 customize it in any way you need. If you need your subclass
 to use a different cell type than its parent, just override
 `cell(for:)` to return the cell you need.
 
 
 ## Appearance
 
 Since `MenuItem` should be presentation agnostic, it should
 not have any styling connected to it. However, due to how a
 menu item creates a cell and how the action sheet must know
 about its items' heights, you specify the height of an item
 by setting its static `height` property.
 
 
 ## Tap Behavior
 
 `tapBehavior` is used to describe what should happen when a
 user taps an item. `.dismiss` means that the menu should be
 dismissed while `.none` means that it shouldn't.
 */
open class MenuItem {
    
    
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
    }
    
    
    // MARK: - Types
    
    public enum TapBehavior {
        case dismiss, none
    }
    
    
    // MARK: - Properties
    
    public var image: UIImage?
    public var subtitle: String?
    public var tapBehavior: TapBehavior
    public var title: String
    public var value: Any?
    
    
    // MARK: - Functions
    
    open func handleSelection(in menu: Menu) {}
    
    
    // MARK: - ActionSheetItem
    
    private static var heights = [String: CGFloat]()
    
    public static var height: CGFloat {
        get { heights[String(describing: self)] ?? 50 }
        set { heights[String(describing: self)] = newValue }
    }
    
    public var height: CGFloat {
        type(of: self).height
    }
    
    open func cell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetItemCell(style: cellStyle)
    }
    
    open var cellStyle: UITableViewCell.CellStyle {
        subtitle == nil ? .default : .value1
    }
}
