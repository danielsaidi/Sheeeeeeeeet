//
//  ActionSheet+Scroll.swift
//  Sheeeeeeeeet
//
//  Created by Sebastian Bolling on 2019-01-16.
//  Copyright © 2019 Sebastian Bolling. All rights reserved.
//

/*
 
 This extension can be used to scroll to the first selected
 item in scrollable action sheets that have many items.
 
 */

import UIKit

public extension ActionSheet {

    func scrollToFirstSelectedItem(at position: UITableView.ScrollPosition = .middle, animated: Bool = false) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50)) { [weak self] in
            guard
                let items = self?.items(ofType: ActionSheetSelectItem.self),
                let index = (items.index { $0.isSelected == true })
                else { return }
            let path = IndexPath(row: index, section: 0)
            self?.itemsTableView?.scrollToRow(at: path, at: position, animated: animated)
        }
    }
}
