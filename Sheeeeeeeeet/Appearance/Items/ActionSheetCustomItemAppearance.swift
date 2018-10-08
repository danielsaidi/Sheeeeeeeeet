//
//  ActionSheetCustomItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public class ActionSheetCustomItemAppearance: ActionSheetItemAppearance {

    public override init(copy: ActionSheetItemAppearance) {
        super.init()
        self.height = copy.height
    }
}
