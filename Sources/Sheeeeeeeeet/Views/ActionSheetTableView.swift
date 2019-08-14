//
//  ActionSheetTableView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-11-24.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This table view is the base class for all table views in an
 action sheet. You can apply custom appearances to this view
 and its subclasses, using their appearance proxies.
 */
open class ActionSheetTableView: UITableView {
    
    
    // MARK: - Setup
    
    /**
     Setup the table view within an action sheet. The return
     value is the resulting height constraint, which must be
     applied to a reference in order to be changed.
     */
    open func setup(in sheet: ActionSheet, itemHandler: ActionSheetItemHandler, heightPriority: Float = 1000) -> NSLayoutConstraint {
        delegate = itemHandler
        dataSource = itemHandler
        alwaysBounceVertical = false
        estimatedRowHeight = 44
        rowHeight = UITableView.automaticDimension
        cellLayoutMarginsFollowReadableWidth = false
        
        let constraint = heightAnchor.constraint(equalToConstant: 150)
        constraint.priority = UILayoutPriority(heightPriority)
        constraint.isActive = true
        sheet.stackView.addArrangedSubview(self)
        return constraint
    }
    
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
    }
    
    
    // MARK: - Appearance
    
    @objc public dynamic var cornerRadius: CGFloat = 10
    
    
    // MARK: - Legacy
    
    @available(*, deprecated, message: "Use separatorColor instead.")
    @objc public dynamic var separatorLineColor: UIColor?
}
