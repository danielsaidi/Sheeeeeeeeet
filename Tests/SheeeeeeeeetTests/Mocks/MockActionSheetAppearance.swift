//
//  MockActionSheetAppearance.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import MockNRoll

class MockActionSheetAppearance: ActionSheetAppearance {
    
    let recorder = Mock()
    
    override func apply() {
        recorder.invoke(self.apply, args: ())
    }
}
