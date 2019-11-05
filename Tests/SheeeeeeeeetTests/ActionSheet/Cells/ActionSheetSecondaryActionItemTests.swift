//
//  ActionSheetSecondaryActionItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-11-01.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class ActionSheetSecondaryActionItemTests: QuickSpec {
    
    override func spec() {
        
        describe("refreshing") {
            
            var item: SecondaryActionItem!
            var cell: ActionSheetSecondaryActionItemCell!
            
            beforeEach {
                item = SecondaryActionItem(title: "title", subtitle: "subtitle", secondaryAction: { _ in })
                cell = ActionSheetSecondaryActionItemCell(style: .value1)
                cell.secondaryActionIcon = UIImage()
                cell.secondaryActionIconColor = .green
                cell.refresh(with: item)
            }
            
            it("refreshes correctly") {
                cell.refresh()
                expect((cell.accessoryView as? UIImageView)?.image).to(be(cell.secondaryActionIcon))
                expect(cell.accessoryView?.tintColor).to(equal(cell.secondaryActionIconColor))
            }
        }
    }
}
