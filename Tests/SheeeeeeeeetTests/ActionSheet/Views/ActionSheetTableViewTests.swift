//
//  ActionSheetTableViewTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-15.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetTableViewTests: QuickSpec {
    
    override func spec() {
        
        describe("setting up in action sheet") {
            
            var view: ActionSheetTableView!
            var sheet: ActionSheet!
            var handler: ActionSheetItemHandler!
            var constraint: NSLayoutConstraint!
            
            beforeEach {
                view = ActionSheetTableView()
                sheet = ActionSheet(menu: .empty) { _, _ in }
                handler = sheet.buttonHandler
                constraint = view.setup(in: sheet, itemHandler: handler, heightPriority: 123)
            }
            
            it("sets up view") {
                expect(view.delegate).to(be(handler))
                expect(view.dataSource).to(be(handler))
                expect(view.alwaysBounceVertical).to(beFalse())
                expect(view.estimatedRowHeight).to(equal(44))
                expect(view.rowHeight).to(equal(UITableView.automaticDimension))
                expect(view.cellLayoutMarginsFollowReadableWidth).to(beFalse())
            }
            
            it("adds view as subview") {
                expect(sheet.stackView.arrangedSubviews.contains(view)).to(beTrue())
            }
            
            it("sets up constraint") {
                expect(constraint.constant).to(equal(150))
                expect(constraint.priority).to(equal(UILayoutPriority(123)))
                
            }
        }
        
        describe("laying out subviews") {
            
            it("works correctly") {
                let view = ActionSheetTableView(frame: .zero)
                view.cornerRadius = 123
                view.layoutSubviews()
                expect(view.layer.cornerRadius).to(equal(123))
            }
        }
    }
}
