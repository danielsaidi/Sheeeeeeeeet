//
//  ActionSheetCollectionItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Jonas Ullström (ullstrm) on 2018-03-01.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import CoreGraphics
import UIKit

open class ActionSheetCollectionItemCell: ActionSheetItemCell {
    
    
    // MARK: - Properties
    
    private var handler: ActionSheetCollectionItemCellHandler?
    
    static let itemCellIdentifier = ActionSheetCollectionItemCell.className
    
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.backgroundColor = .clear
        contentView.addSubview(view, fill: true)
        return view
    }()
    
    
    // MARK: - Functions
    
    func setup(withNib nib: UINib, handler: ActionSheetCollectionItemCellHandler) {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        collectionView.contentInset = .zero
        collectionView.register(nib, forCellWithReuseIdentifier: id)
        self.handler = handler
        collectionView.dataSource = handler
        collectionView.delegate = handler
        collectionView.reloadData()
    }
}
