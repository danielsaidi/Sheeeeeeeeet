//
//  MenuConfiguration.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Menu {
    
    /**
     This struct specify which configuration to use for menu
     instances. Use `Menu.Configuration.standard` to get the
     standard configuration.
     */
    struct Configuration {
        
        /**
         Create a configuration instance.
         */
        public init(isDismissable: Bool) {
            self.isDismissable = isDismissable
        }
        
        /**
         Whether or not it should be possible to dismiss the
         menu without using any of its options or buttons.
         */
        public let isDismissable: Bool
        
        /**
         The standard menu configuration that is used if you
         do not provide a custom configuration.
         */
        public static var standard: Configuration {
            Configuration(isDismissable: true)
        }
        
        /**
         A configuration that makes the menu non-dismissable.
         */
        public static var nonDismissable: Configuration {
            Configuration(isDismissable: false)
        }
    }
}
