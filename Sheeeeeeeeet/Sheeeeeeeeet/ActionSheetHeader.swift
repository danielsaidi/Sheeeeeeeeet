//
//  ActionSheetHeader.swift
//  Sheeeeeeeeet
//
//  Created by Mikael Bertlin on 2017-11-19.
//  Copyright © 2017 Mikael Bertlin. All rights reserved.
//

import UIKit

open class ActionSheetHeader: UIView {
    
    
    // MARK: - Initialization
    
    public init(title: String, frame: CGRect) {
        super.init(frame: frame)
        self.title = title
        addSubview(headerLabel)
    }
    
    required public init?(coder aDecoder: NSCoder) { fatalError() }
    
    
    // MARK: - Overrides
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let inset = UIEdgeInsetsMake(20, 0, 0, 0)
        let frame = UIEdgeInsetsInsetRect(bounds, inset)
        headerLabel.frame = frame
    }
    
    
    // MARK: - Properties
    
    public var title: String? {
        get { return headerLabel.text }
        set { headerLabel.text = title }
    }
    
    
    // MARK: - Views
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        /*let appearance = ActionSheetAppearance.standard
        label.textAlignment = .center
        label.font = appearance.header.font
        label.textColor = appearance.header.textColor*/
        return label
    }()
}
