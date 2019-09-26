//
//  ContextMenuConversionError.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum specifies the errors that can occur when a `Menu`
 is converted to a `UIMenu` and a `MenuItem` to a `UIAction`.
 */
public enum ContextMenuConversionError: Error {
    
    case unsupportedItemType
    case unsupportedItemTypes
}
