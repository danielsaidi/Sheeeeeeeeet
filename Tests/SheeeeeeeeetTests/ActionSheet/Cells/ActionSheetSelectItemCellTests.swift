//
//  ActionSheetSelectItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class ActionSheetSelectItemCellTests: QuickSpec {
    
    override func spec() {
        
        describe("refreshing") {
            
            var item: SelectItem!
            var cell: ActionSheetSelectItemCell!
            
            beforeEach {
                item = SelectItem(title: "title", subtitle: "subtitle", isSelected: false)
                cell = ActionSheetSelectItemCell(style: .value1)
                cell.tintColor = UIColor.purple.withAlphaComponent(0.1)
                cell.titleColor = UIColor.yellow.withAlphaComponent(0.1)
                cell.titleFont = .systemFont(ofSize: 11)
                cell.subtitleColor = UIColor.red.withAlphaComponent(0.1)
                cell.subtitleFont = .systemFont(ofSize: 12)
                cell.disabledTitleColor = .red
                cell.disabledSubtitleColor = .purple
                cell.selectedIcon = UIImage()
                cell.selectedIconColor = .green
                cell.selectedTintColor = .purple
                cell.selectedTitleColor = .yellow
                cell.selectedTitleFont = .systemFont(ofSize: 13)
                cell.selectedSubtitleColor = .red
                cell.selectedSubtitleFont = .systemFont(ofSize: 14)
                cell.unselectedIcon = UIImage()
                cell.unselectedIconColor = UIColor.green.withAlphaComponent(0.1)
                cell.refresh(with: item)
            }
            
            it("refreshes correctly for selected item") {
                item.isSelected = true
                cell.refresh()
                expect((cell.accessoryView as? UIImageView)?.image).to(be(cell.selectedIcon))
                expect(cell.accessoryView?.tintColor).to(equal(cell.selectedIconColor))
                expect(cell.tintColor).to(equal(cell.selectedTintColor))
                expect(cell.textLabel?.textColor).to(equal(cell.selectedTitleColor))
                expect(cell.textLabel?.font).to(equal(cell.selectedTitleFont))
                expect(cell.detailTextLabel?.textColor).to(equal(cell.selectedSubtitleColor))
                expect(cell.detailTextLabel?.font).to(equal(cell.selectedSubtitleFont))
            }
            
            it("refreshes correctly for unselected item") {
                item.isSelected = false
                cell.refresh()
                expect((cell.accessoryView as? UIImageView)?.image).to(be(cell.unselectedIcon))
                expect(cell.accessoryView?.tintColor).to(equal(cell.unselectedIconColor))
                expect(cell.tintColor).to(be(cell.tintColor))
                expect(cell.textLabel?.textColor).to(be(cell.titleColor))
                expect(cell.textLabel?.font).to(be(cell.titleFont))
                expect(cell.detailTextLabel?.textColor).to(equal(cell.subtitleColor))
                expect(cell.detailTextLabel?.font).to(equal(cell.subtitleFont))
            }
            
            it("refreshes correctly for disabled item") {
                item.isEnabled = false
                cell.refresh()
                expect(cell.textLabel?.textColor).to(equal(.red))
                expect(cell.detailTextLabel?.textColor).to(equal(.purple))
            }
        }
    }
}
