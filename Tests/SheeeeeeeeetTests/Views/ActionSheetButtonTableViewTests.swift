//
//  ActionSheetButtonTableViewTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-14.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetButtonTableViewTests: QuickSpec {
    
    override func spec() {
        
        describe("fixing xcode bug") {
            
            it("sets background color") {
                let view = ActionSheetButtonTableView()
                ActionSheetButtonTableView.appearance().backgroundColor = .yellow
                view.fixXcodeAppearanceBug()
                expect(view.backgroundColor).to(equal(.yellow))
            }
        }
    }
}
