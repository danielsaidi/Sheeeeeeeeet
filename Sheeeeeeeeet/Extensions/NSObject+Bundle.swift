//
//  NSObject+Bundle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-12-25.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

extension NSObject {
    
    static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    var bundle: Bundle {
        return type(of: self).bundle
    }
}
