//
//  ActionSheetConfiguration.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ContextMenu {
    
    /**
     This struct specifies how a native context menu behaves.
     `ContextMenu.Configuration.standard` returns a standard
     configuration, which is used by default.
     */
    struct Configuration: Equatable {
        
        /**
         Create a configuration instance.
         */
        public init(
            shouldBeDismissedWhenEnteringBackground: Bool = false) {
            self.shouldBeDismissedWhenEnteringBackground = shouldBeDismissedWhenEnteringBackground
        }
        
        /**
         Whether or not the context menu should be dismissed
         automatically when an app is sent to the background.
        */
        public let shouldBeDismissedWhenEnteringBackground: Bool
        
        
        /**
         The standard context menu configuration.
         
         * `shouldBeDismissedWhenEnteringBackground` = `false`
         */
        public static var standard: Configuration {
            Configuration()
        }
        
        /**
         A configuration that makes the context menu dismiss
         automatically when an app is sent to the background.
         
         * `shouldBeDismissedWhenEnteringBackground` = `true`
         */
        public static var backgroundDismissable: Configuration {
            Configuration(shouldBeDismissedWhenEnteringBackground: true)
        }
    }
}
