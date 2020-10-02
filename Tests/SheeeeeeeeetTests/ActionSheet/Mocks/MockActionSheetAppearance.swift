//
//  MockActionSheetAppearance.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import MockingKit

class MockActionSheetAppearance: ActionSheetAppearance, Mockable {
    
    lazy var applyRef = MockReference(apply)
    
    let mock = Mock()
    
    override func apply() {
        call(applyRef, args: ())
    }
}
