//
//  LinkItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class LinkItemAppearance: ItemAppearance {
    
    
    // MARK: - Initialization
    
    override init() {
        super.init()
    }
    
    override init(template: ItemAppearance) {
        super.init(template: template)
    }
    
    convenience init(template: LinkItemAppearance) {
        self.init(template: template)
        linkIcon = template.linkIcon
    }
    
    
    // MARK: - Properties
    
    public var linkIcon: UIImage?
}

