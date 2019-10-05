//
//  DemoCollectionViewCell.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström (ullstrm) on 2018-02-23.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

/**
 This cell is used by the `CollectionMenu` to populate cells
 in the `CollectionActionSheet`.
 */
class DemoCollectionViewCell: UICollectionViewCell, CollectionItemType {
    
    
    // MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        badge?.layer.cornerRadius = 10
    }
    
    
    // MARK: - CollectionItemType
    
    static let preferredSize = CGSize(width: 100, height: 100)
    static let leftInset: CGFloat = 10
    static let rightInset: CGFloat = 20
    static let topInset: CGFloat = 10
    static let bottomInset: CGFloat = 10
    static let itemSpacing: CGFloat = 0
    
    
    // MARK: - Item
    
    class Item: Equatable {
        
        init(title: String) {
            self.title = title
            self.isSelected = false
        }
        
        var title: String
        var isSelected: Bool
        
        static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.title == rhs.title
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var badge: UIView?
    
    @IBOutlet weak var titleLabel: UILabel?
    
    
    // MARK: - Public Functions
    
    func configureWith(item: Item) {
        titleLabel?.text = item.title
        titleLabel?.textColor = item.isSelected ? .white : .black
        badge?.backgroundColor = item.isSelected ? .green : .lightGray
    }
}
