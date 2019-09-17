//
//  MenuTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Title items can be used to add main titles to a menu.
 */
open class MenuTitle: MenuItem {
    
    public init(title: String) {
        super.init(title: title, tapBehavior: .none)
    }
}
