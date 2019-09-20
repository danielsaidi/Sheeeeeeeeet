//
//  UIColor+ActionSheetColor.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIColor {
 
    /**
     Get the UIColor value of a semantic ActionSheet color.
     */
    static func sheetColor(_ color: ActionSheetColor) -> UIColor {
        color.color
    }
}
