//
//  IntrinsicTableView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-10-31.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

class IntrinsicTableView: UITableView {
    
    override var contentSize: CGSize {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
