//
//  ActionSheetHeaderContainerView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This view is used as a container for a sheet's header view.
 */
open class ActionSheetHeaderContainerView: UIView {
    
    
    // MARK: - Setup
    
    open func setup(in sheet: ActionSheet) {
        clipsToBounds = true
        sheet.headerViewContainerHeight = heightAnchor.constraint(equalToConstant: 150)
        sheet.headerViewContainerHeight?.isActive = true
        sheet.stackView.addArrangedSubview(self)
    }

    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
    }
    
    
    // MARK: - Appearance Properties
    
    @objc dynamic public var cornerRadius: CGFloat = 10
}
