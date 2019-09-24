//
//  CollectionItem_ActionSheetTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import CoreGraphics
import Sheeeeeeeeet
import UIKit

class CollectionItem_ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        describe("action sheet cell") {
            
            it("is of correct type") {
                let item = CollectionItem(itemType: TestType.self, itemCount: 100, itemSetupAction: { _, _ in }, itemSelectionAction: { _, _ in })
                let cell = item.actionSheetCell(for: UITableView())
                expect(cell is ActionSheetCollectionItemCell).to(beTrue())
            }
        }
    }
}

private class TestType: CollectionItemType {
    
    static var preferredSize: CGSize { .zero }
    static var leftInset: CGFloat { 0 }
    static var rightInset: CGFloat { .zero }
    static var topInset: CGFloat { .zero }
    static var bottomInset: CGFloat { .zero }
    static var itemSpacing: CGFloat { .zero }
}
