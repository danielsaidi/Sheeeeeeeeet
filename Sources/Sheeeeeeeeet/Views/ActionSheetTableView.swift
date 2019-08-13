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
        fixXcodeAppearanceBug()
    }
    
    
    // MARK: - Appearance
    
    @objc public dynamic var cornerRadius: CGFloat = 10
    
    /**
     Fix the Xcode 11 background color bug.
     
     Xcode currently has a bug, where the appearance proxy's
     background color is overwritten by the background color
     that is defined in the xib file. This function sets the
     background color to the one specifiec by the appearance
     proxy. If you want to change this at a later state, you
     must override `layoutSubviews()` and perform the change
     after calling `super.layoutSubviews()`.
     */
    open func fixXcodeAppearanceBug() {
        backgroundColor = ActionSheetTableView.appearance().backgroundColor
    }
    
    
    // MARK: - Legacy
    
    @available(*, deprecated, message: "Use separatorColor instead.")
    @objc public dynamic var separatorLineColor: UIColor?
}
