//
//  ActionSheetItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetItemCellTests: QuickSpec {
    
    override func spec() {
        
        describe("moving to window") {
            
            it("refreshes cell") {
                let item = MenuItem(title: "foo", subtitle: "bar", value: "baz", image: nil)
                let cell = ActionSheetItemCell(style: .default)
                cell.refresh(with: item)
                cell.textLabel?.text = ""
                cell.didMoveToWindow()
                expect(cell.textLabel?.text).to(equal("foo"))
            }
        }
        
        
        describe("refreshing") {
            
            it("aborts if cell has no item reference") {
                let cell = ActionSheetItemCell()
                cell.refresh()
                expect(cell.textLabel?.text).to(beNil())
            }
            
            it("refreshes if cell has item reference") {
                let image = UIImage()
                let item = MenuItem(title: "foo", subtitle: "bar", value: "baz", image: image)
                let cell = ActionSheetItemCell(style: .value1)
                cell.titleFont = .boldSystemFont(ofSize: 1)
                cell.subtitleFont = .boldSystemFont(ofSize: 2)
                cell.titleColor = .yellow
                cell.subtitleColor = .brown
                cell.tintColor = .red
                cell.disabledTitleColor = .red
                cell.disabledSubtitleColor = .purple
                cell.disabledTintColor = .cyan
                
                cell.refresh(with: item)
                
                expect(cell.isUserInteractionEnabled).to(beTrue())
                expect(cell.tintColor).to(equal(.red))
                expect(cell.imageView?.image).to(be(image))
                expect(cell.selectionStyle).to(equal(.default))
                expect(cell.textLabel?.font).toNot(beNil())
                expect(cell.textLabel?.font).to(be(cell.titleFont))
                expect(cell.textLabel?.text).to(equal("foo"))
                expect(cell.textLabel?.textColor).to(equal(.yellow))
                expect(cell.textLabel?.textAlignment).to(equal(.left))
                expect(cell.detailTextLabel?.font).toNot(beNil())
                expect(cell.detailTextLabel?.font).to(be(cell.subtitleFont))
                expect(cell.detailTextLabel?.text).to(equal("bar"))
                expect(cell.detailTextLabel?.textColor).to(equal(.brown))
            }
            
            it("applies disabled colors if cell is disabled") {
                let item = MenuItem(title: "foo", subtitle: "bar", value: "baz", image: nil, isEnabled: false)
                let cell = ActionSheetItemCell(style: .value1)
                cell.titleColor = .yellow
                cell.subtitleColor = .brown
                cell.tintColor = .blue
                cell.disabledTitleColor = .red
                cell.disabledSubtitleColor = .purple
                cell.disabledTintColor = .cyan

                cell.refresh(with: item)
                
                expect(cell.isUserInteractionEnabled).to(beFalse())
                expect(cell.tintColor).to(equal(.cyan))
                expect(cell.textLabel?.textColor).to(equal(.red))
                expect(cell.detailTextLabel?.textColor).to(equal(.purple))
            }
        }
    }
}
