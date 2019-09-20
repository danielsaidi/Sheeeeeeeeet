//
//  ActionSheetCustomViewItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A custom item can be used to present any views in an action
 sheet, using custom views that are injected into the cells.
 
 In this implementation `T` must be a `UIView` and implement
 `CustomItemType`. The class must have a `xib` file with the
 same name as the class, in the same bundle as the class.
 */
public class ActionSheetCustomItem<T: CustomItemType>: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(cellType: T.Type, setupAction: @escaping SetupAction) {
        self.cellType = cellType
        self.setupAction = setupAction
        super.init(
            title: "",
            subtitle: nil,
            value: nil,
            image: nil,
            tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias SetupAction = (_ cell: T) -> ()
    
    
    // MARK: - Properties
    
    public override var height: CGFloat { T.defaultSize.height }
    
    public let cellType: T.Type
    public let setupAction: SetupAction
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        let className = String(describing: T.self)
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
        let dequeued = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        guard let item = dequeued as? T else { fatalError("Invalid item resolved for CustomItemType") }
        guard let cell = item as? ActionSheetItemCell else { fatalError("ActionSheetCustomItem only supports CustomItemType's that inherit ActionSheetItemCell") }
        setupAction(item)
        return cell
    }
}
