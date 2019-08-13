//
//  NSObject+Bundle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-12-25.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

//  This file contains internal util functions for resolving
//  the bundle of classes and class instances.

import UIKit

extension NSObject {
    
    /**
     Get the type's bundle.
     */
    static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    /**
     Get the class' bundle.
     */
    var bundle: Bundle {
        return type(of: self).bundle
    }
}
