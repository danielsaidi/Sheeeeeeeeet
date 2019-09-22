//
//  ActionSheet+Scroll.swift
//  Sheeeeeeeeet
//
//  Created by Sebastian Bolling on 2019-01-16.
//  Copyright © 2019 Sebastian Bolling. All rights reserved.
//

import UIKit

public extension ActionSheet {

    /**
     Scroll to the first selected select item, if any.
     */
    func scrollToFirstSelectedItem(at position: UITableView.ScrollPosition = .middle, animated: Bool = false) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50)) { [weak self] in
            guard
                let items = self?.items.compactMap({ $0 as? SelectItem }),
                let index = (items.firstIndex { $0.isSelected == true })
                else { return }
            let path = IndexPath(row: index, section: 0)
            self?.itemsTableView.reloadData()
            self?.itemsTableView.scrollToRow(at: path, at: position, animated: animated)
        }
    }
}
