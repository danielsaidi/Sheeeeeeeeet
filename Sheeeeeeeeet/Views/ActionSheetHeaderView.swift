//
//  ActionSheetHeaderView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetHeaderView: UIView {
    
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
    }

    
    // MARK: - Appearance Properties
    
    @objc dynamic public var cornerRadius: CGFloat = 10
}
