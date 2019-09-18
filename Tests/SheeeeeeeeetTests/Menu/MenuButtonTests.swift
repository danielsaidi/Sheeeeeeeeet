//
//  MenuButtonTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet

class MenuButtonTests: QuickSpec {
    
    override func spec() {
        
        describe("creating menu button") {
            
            it("sets up provided properties") {
                let item = MenuButton(title: "title", type: .cancel)
                
                expect(item.title).to(equal("title"))
                expect(item.subtitle).to(beNil())
                expect(item.value as? MenuButton.ButtonType).to(equal(.cancel))
                expect(item.image).to(beNil())
                expect(item.tapBehavior).to(equal(.dismiss))
            }
        }
        
        describe("action sheet conversion") {
            
            it("can be converted to an action sheet item") {
                let source = MenuButton(title: "title", type: .cancel)
                let item = source.toActionSheetItem() as? ActionSheetButton
                
                expect(item?.title).to(equal("title"))
                expect(item?.subtitle).to(beNil())
                expect(item?.value as? MenuButton.ButtonType).to(equal(.cancel))
                expect(item?.image).to(beNil())
                expect(item?.tapBehavior).to(equal(.dismiss))
            }
        }
    }
}
