//
//  ActionSheetLinkItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "ActionSheetLinkItemAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetLinkItemAppearance: ActionSheetItemAppearance {
    
    public override init() {
        super.init()
    }
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init(copy: copy)
        let copy = copy as? ActionSheetLinkItemAppearance
        linkIcon = copy?.linkIcon
    }
    
    public var linkIcon: UIImage?
}
