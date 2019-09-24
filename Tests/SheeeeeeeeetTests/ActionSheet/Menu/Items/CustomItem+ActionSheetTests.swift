//
//  CustomItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class CustomItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet") {
            
            describe("height") {
                
                it("is cell type's default height") {
                    let item = CustomItem(itemType: TestType.self, itemSetupAction: { _ in })
                    let expected = Double(TestType.preferredSize.height)
                    expect(item.actionSheetCellHeight).to(equal(expected))
                }
            }
            
            describe("cell") {
                
                it("registers nib, dequeues cell and sets up cell") {
                    // TODO: How to test this in SPM, which doesn't support bundles?
                }
            }
        }
    }
}

private class TestType: ActionSheetItemCell, CustomItemType {
    
    static let preferredSize = CGSize(width: 100, height: 400)
}
