//
//  ActionSheetConfiguration.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-12-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ActionSheet {
    
    /**
     This struct specifies how an action sheet should behave.
     `ActionSheet.Configuration.standard` returns a standard
     configuration, which is used by default.
     */
    struct Configuration: Equatable {
        
        /**
         Create a configuration instance.
         */
        public init(
            isDismissable: Bool,
            shouldBeDismissedWhenEnteringBackground: Bool = false) {
            self.isDismissable = isDismissable
            self.shouldBeDismissedWhenEnteringBackground = shouldBeDismissedWhenEnteringBackground
        }
        
        /**
         Whether or not it should be possible to dismiss the
         action sheet without making a choice.
         */
        public let isDismissable: Bool

        /**
         Whether or not the action sheet should be dismissed
         automatically when an app is sent to the background.
        */
        public let shouldBeDismissedWhenEnteringBackground: Bool
        
        
        /**
         The standard action sheet configuration.
         
         * `isDismissable` = `true`
         * `shouldBeDismissedWhenEnteringBackground` = `false`
         */
        public static var standard: Configuration {
            Configuration(isDismissable: true)
        }
        
        /**
         A configuration that makes a sheet non-dismissable.
         
         * `isDismissable` = `false`
         * `shouldBeDismissedWhenEnteringBackground` = `false`
         */
        public static var nonDismissable: Configuration {
            Configuration(isDismissable: false)
        }
        
        /**
         A configuration that makes the action sheet dismiss
         automatically when an app is sent to the background.
         
         * `isDismissable` = `true`
         * `shouldBeDismissedWhenEnteringBackground` = `true`
         */
        public static var backgroundDismissable: Configuration {
            Configuration(
                isDismissable: true,
                shouldBeDismissedWhenEnteringBackground: true
            )
        }
    }
}
