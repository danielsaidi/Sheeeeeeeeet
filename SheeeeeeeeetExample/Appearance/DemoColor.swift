//
//  DemoColor.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-08-09.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

enum DemoColor {
    
    case text
    
    var color: UIColor {
        if #available(iOS 13.0, *) {
            return adaptiveColor
        } else {
            return legacyColor
        }
    }
    
    @available(iOS 13.0, *)
    private var adaptiveColor: UIColor {
        switch self {
        case .text: return .label
        }
    }
    
    private var legacyColor: UIColor {
        switch self {
        case .text: return .darkText
        }
    }
}
