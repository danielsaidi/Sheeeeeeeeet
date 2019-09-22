//
//  CustomItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

/**
 Custom items can be used to present "custom items" (duh) in
 a way that depends on how the item is used. For instance, a
 custom item that is mapped to an `ActionSheetCustomItem` is
 going to use `UIKit` and `nib` files, while a `SwiftUI` app
 may handle it completely different.
 */
open class CustomItem<T: CustomItemType>: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(itemType: T.Type, itemSetupAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemSetupAction = itemSetupAction
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias ItemAction = (T) -> Void
    
    
    // MARK: - Properties
    
    public let itemType: T.Type
    public let itemSetupAction: ItemAction
    

    // MARK: - ActionSheet
    
    public override var height: CGFloat { T.defaultSize.height }
    
    /**
     When getting an action sheet cell for a custom item, `T`
     must be a `UIView` and must implement `CustomItemType`.
     It must have a matching .xib file with the same name as
     the class in the same bundle.
     */
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        let className = String(describing: self)
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
        let dequeued = tableView.dequeueReusableCell(withIdentifier: className)
        guard let item = dequeued as? T else { fatalError("Invalid item resolved for CustomItemType") }
        guard let cell = item as? ActionSheetItemCell else { fatalError("ActionSheetCustomItem only supports CustomItemType's that inherit ActionSheetItemCell") }
        itemSetupAction(item)
        return cell
    }
}


/**
 This protocol must be implemented by any item that is to be
 used together with an `CustomItem`, regardless of what that
 item will later be used for.
 */
public protocol CustomItemType {
    
    static var defaultSize: CGSize { get }
}
