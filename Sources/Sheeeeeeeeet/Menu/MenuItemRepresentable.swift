//
//  MenuItemRepresentable.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-18.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This internal protocol is used to share logic between menus
 and items, representing them in the most general way.
 
 For instance, the framework-agnostic `Menu` and and the old
 UIKit `ActionSheet` classes are menus, but have very little
 in common except having "items".
 */
public protocol MenuItemRepresentable {}
