//
//  ActionSheet+Header.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheet {
    
    /**
     This configuration is used to setup how an action sheet
     header view behaves in various contexts.
     */
    struct HeaderViewConfiguration {
        
        public init(isVisibleInLandscape: Bool, isVisibleInPopover: Bool) {
            self.isVisibleInLandscape = isVisibleInLandscape
            self.isVisibleInPopover = isVisibleInPopover
        }
        
        public let isVisibleInLandscape: Bool
        public let isVisibleInPopover: Bool
        
        public static var standard: HeaderViewConfiguration {
            HeaderViewConfiguration(
                isVisibleInLandscape: true,
                isVisibleInPopover: true
            )
        }
    }
}
