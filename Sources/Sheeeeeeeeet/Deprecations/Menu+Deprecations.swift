//
//  Menu+Deprecations.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-12-09.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Menu {

    @available(*, deprecated, message: """
    Menu.Configuration is disabled and doesn't do anything anymore.
    Use the new action sheet and context menu configurations instead.
    """)
    convenience init(
        title: String? = nil,
        items: [MenuItem],
        configuration: Configuration = .standard) {
        self.init(title: title, items: items)
    }
    
    @available(*, deprecated, message: """
    Menu.Configuration is disabled and doesn't do anything anymore.
    Use the new action sheet and context menu configurations instead.
    """)
    struct Configuration {

        public init(isDismissable: Bool, shouldDismissOnDidEnterBackground: Bool = false) {
            self.isDismissable = isDismissable
            self.shouldDismissOnDidEnterBackground = shouldDismissOnDidEnterBackground
        }
        
        public let isDismissable: Bool
        public let shouldDismissOnDidEnterBackground: Bool
        public static var standard: Configuration { Configuration(isDismissable: true) }
        public static var nonDismissable: Configuration { Configuration(isDismissable: false) }
    }
}
