//
//  CollectionViewItem.swift
//  SheeeeeeeeetExample
//
//  Created by Ullström Jonas (BookBeat) on 2018-02-23.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class MyCellDataHolder: Equatable {
    
    init(title: String, subtitle: String, isSelected: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
    }
    
    init(copy: MyCellDataHolder) {
        self.title = copy.title
        self.subtitle = copy.subtitle
        self.isSelected = copy.isSelected
    }
    
    var title: String
    var subtitle: String
    var isSelected: Bool
    
    static func == (lhs: MyCellDataHolder, rhs: MyCellDataHolder) -> Bool {
        return lhs.title == rhs.title && lhs.subtitle == rhs.subtitle
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    
    func configureWith(item: MyCellDataHolder) {
        titleLabel?.text = item.title
        titleLabel?.textColor = item.isSelected ? UIColor.orange : UIColor.black
    }
}

extension MyCollectionViewCell: ActionSheetCollectionViewItemContentCell {
    static let leftInset: CGFloat = 0
    static let rightInset: CGFloat = 50
    static let topInset: CGFloat = 10
    static let bottomInset: CGFloat = 5
    
    static let itemSpacing: CGFloat = 50
    
    static let defaultSize = CGSize(width: 100, height: 100)
    static let nib: UINib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
}
