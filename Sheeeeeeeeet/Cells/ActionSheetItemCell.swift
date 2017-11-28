//
//  ActionSheetItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetItemCell: UITableViewCell {
    
    
    // MARK: - Public Functions
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        adjustImageMargin()
    }
}


fileprivate extension ActionSheetItemCell {
    
    func adjustImageMargin() {
        guard let view = imageView, let label = textLabel else { return }
        guard view.image != nil else { return }
        view.center.x += 5
        label.center.x += 5
    }
}
