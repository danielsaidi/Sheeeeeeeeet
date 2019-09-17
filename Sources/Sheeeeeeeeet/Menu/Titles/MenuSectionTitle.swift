//
//  MenuSectionTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Section titles can be used to add titles to sections within
 a menu. They have no purpose besides visually indicating if
 items belong together.
 
 To add additional space above a section title, make sure to
 add a `MenuSectionTitleMargin` before the title.
 */
open class MenuSectionTitle: MenuItem {
    
    public init(title: String, subtitle: String) {
        super.init(title: title, subtitle: subtitle, tapBehavior: .none)
    }
}
