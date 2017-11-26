//
//  ActionSheetItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a regular action sheet item, like the
 ones used by UIAlertController. It has an optional value to
 help identify what the user taps, as well as a title and an
 optional image.
 
 The default tap behavior of an action sheet item is to tell
 the action sheet that it was tapped, then dismiss the sheet.
 If you don't want the item to dismiss the action sheet, you
 can set the `tapBehavior` property to `none`.
 
 An action sheet item's appearance is set by the sheet, when
 it is presented. To use custom appearances for single items,
 just set the `appearance` property to a custom value.
 
 */

import UIKit

open class ActionSheetItem: NSObject {
    
    
    // MARK: - Initialization
    
    public init(value: Any, title: String, image: UIImage? = nil) {
        let appearance = ActionSheetAppearance.standard.item
        self.value = value
        self.title = title
        self.image = image
        self.appearance = ActionSheetItemAppearance(copy: appearance)
        super.init()
    }
    
    
    // MARK: - Properties
    
    open var value: Any
    open var image: UIImage?
    open var title: String
    
    open var appearance: ActionSheetItemAppearance
    open var tapBehavior: ActionSheetItemTapBehavior = .dismiss
    
    
    // MARK: - Internal Properties
    
    var dismissesOnTap: Bool {
        switch tapBehavior {
        case .dismiss: return true
        default: return false
        }
    }
    
    
    // MARK: - Functions
    
    open func applyAppearance(_ appearance: ActionSheetAppearance) {
        let template = appearance.item
        self.appearance = ActionSheetItemAppearance(copy: template)
    }
    
    open func applyAppearance(to cell: UITableViewCell) {
        cell.imageView?.image = image
        cell.textLabel?.text = title
        cell.separatorInset = appearance.separatorInsets
        cell.tintColor = appearance.tintColor
        cell.textLabel?.textColor = appearance.textColor
        cell.textLabel?.font = appearance.font
    }
    
    open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = type(of: self).className
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ActionSheetItemCell
            ?? ActionSheetItemCell(style: .default, reuseIdentifier: id)
        applyAppearance(to: cell)
        return cell
    }
}
