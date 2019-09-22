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
                let cell = item.cell(for: UITableView())
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
                let cell = item.cell(for: UITableView())
                cell.titleColor = .yellow
                cell.titleFont = .boldSystemFont(ofSize: 1)
                cell.subtitleColor = .brown
                cell.subtitleFont = .boldSystemFont(ofSize: 2)
                
                cell.refresh(with: item)
                
                expect(cell.imageView?.image).to(be(image))
                expect(cell.selectionStyle).to(equal(.default))
                expect(cell.textLabel?.font).toNot(beNil())
                expect(cell.textLabel?.font).to(be(cell.titleFont))
                expect(cell.textLabel?.text).to(equal("foo"))
                expect(cell.textLabel?.textAlignment).to(equal(.left))
                expect(cell.detailTextLabel?.font).toNot(beNil())
                expect(cell.detailTextLabel?.font).to(be(cell.subtitleFont))
                expect(cell.detailTextLabel?.text).to(equal("bar"))
            }
        }
    }
}
