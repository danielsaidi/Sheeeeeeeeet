//
//  UIEdgeInsets+Hidden.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-13.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

//  This insets extension can be used to hide separators for
//  a certain item type or specific item. Just apply it to a
//  certain appearance proxy or item cell instance.

import UIKit

public extension UIEdgeInsets {

    static var hiddenSeparator: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100_000)
    }
}
