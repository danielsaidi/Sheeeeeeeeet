//
//  ActionSheetItem+Conversions.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-18.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

protocol ActionSheetItemConvertible {
    
    func toActionSheetItem() -> ActionSheetItem
}

extension ActionSheetItem {

    /**
     Create an action sheet item from a convertible item.
     */
    static func from(_ item: ActionSheetItemConvertible) -> ActionSheetItem {
        return item.toActionSheetItem()
    }
}
