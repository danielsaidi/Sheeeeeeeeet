//
//  ActionSheetCustomViewItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Custom items can be used to present any views in your sheet.
 
 It can use any view that inherits `ActionSheetItemCell` and
 implements `ActionSheetCustomItemCell`.
 */
public class ActionSheetCustomItem<T: ActionSheetCustomItemCell>: ActionSheetItem {
    
    
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
        tableView.register(T.nib, forCellReuseIdentifier: cellReuseIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        guard let typedCell = cell as? T else { fatalError("Invalid cell type created by superclass") }
        setupAction(typedCell)
        return typedCell
    }
}


// MARK: -

/**
 This protocol must be implemented by any cell that is to be
 used together with an `ActionSheetCustomItem`.
 */
public protocol ActionSheetCustomItemCell where Self: ActionSheetItemCell {
    
    static var nib: UINib { get }
    static var defaultSize: CGSize { get }
}
