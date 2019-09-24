//
//  MenuItem+ContextMenuTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

@available(iOS 13.0, *)
class MenuItem_ContextMenuTests: QuickSpec {
    
    override func spec() {
        
        func getCollectionItem() -> CollectionItem {
            CollectionItem(itemType: TestCollectionItemType.self, itemCount: 0, itemSetupAction: { _, _ in }, itemSelectionAction: { _, _ in })
        }
        
        func getCustomItem() -> CustomItem {
            CustomItem(itemType: TestCustomItemType.self, itemSetupAction: { _ in })
        }
        
        describe("can be used in context menu") {
            
            func result(for item: MenuItem) -> Bool {
                item.canBeUsedInContextMenu
            }
            
            it("is true for items that can be mapped to `UIAction` and still serve their purpose") {
                expect(result(for: MenuItem(title: ""))).to(beTrue())
                expect(result(for: LinkItem(title: ""))).to(beTrue())
                expect(result(for: SelectItem(title: "", isSelected: false))).to(beTrue())
                
                expect(result(for: MenuButton(title: "", type: .ok))).to(beFalse())
                expect(result(for: OkButton(title: ""))).to(beFalse())
                expect(result(for: CancelButton(title: ""))).to(beFalse())
                expect(result(for: DestructiveButton(title: ""))).to(beFalse())
                    
                expect(result(for: MenuTitle(title: ""))).to(beFalse())
                expect(result(for: SectionTitle(title: ""))).to(beFalse())
                expect(result(for: SectionMargin())).to(beFalse())
                    
                expect(result(for: getCollectionItem())).to(beFalse())
                expect(result(for: getCustomItem())).to(beFalse())
                expect(result(for: SingleSelectItem(title: "", isSelected: false))).to(beFalse())
                expect(result(for: MultiSelectItem(title: "", isSelected: false))).to(beFalse())
                expect(result(for: MultiSelectToggleItem(title: "", state: .selectAll, group: "", selectAllTitle: "", deselectAllTitle: ""))).to(beFalse())
            }
        }
        
        describe("should be ignored by context menu") {
            
            func result(for item: MenuItem) -> Bool {
                item.shouldBeIgnoredByContextMenu
            }
            
            it("is true for items that serve no functional purpose in the menu and can be safely ignored") {
                expect(result(for: MenuItem(title: ""))).to(beFalse())
                expect(result(for: LinkItem(title: ""))).to(beFalse())
                expect(result(for: SelectItem(title: "", isSelected: false))).to(beFalse())
                
                expect(result(for: MenuButton(title: "", type: .ok))).to(beFalse())
                expect(result(for: OkButton(title: ""))).to(beFalse())
                expect(result(for: CancelButton(title: ""))).to(beTrue())
                expect(result(for: DestructiveButton(title: ""))).to(beFalse())
                    
                expect(result(for: MenuTitle(title: ""))).to(beTrue())
                expect(result(for: SectionTitle(title: ""))).to(beTrue())
                expect(result(for: SectionMargin())).to(beTrue())
                    
                expect(result(for: getCollectionItem())).to(beFalse())
                expect(result(for: getCustomItem())).to(beFalse())
                expect(result(for: SingleSelectItem(title: "", isSelected: false))).to(beFalse())
                expect(result(for: MultiSelectItem(title: "", isSelected: false))).to(beFalse())
                expect(result(for: MultiSelectToggleItem(title: "", state: .selectAll, group: "", selectAllTitle: "", deselectAllTitle: ""))).to(beFalse())
            }
        }
        
        describe("creating context menu action") {
            
            func result(for item: MenuItem) -> Bool {
                switch (item.toContextMenuAction { _ in }) {
                case .failure: return false
                case .success: return true
                }
            }
            
            it("is false for item types that don't make sense in a context menu") {
                expect(result(for: MenuItem(title: ""))).to(beTrue())
                expect(result(for: LinkItem(title: ""))).to(beTrue())
                expect(result(for: SelectItem(title: "", isSelected: false))).to(beTrue())
                
                expect(result(for: MenuButton(title: "", type: .ok))).to(beFalse())
                expect(result(for: OkButton(title: ""))).to(beFalse())
                expect(result(for: CancelButton(title: ""))).to(beFalse())
                expect(result(for: DestructiveButton(title: ""))).to(beFalse())
                
                expect(result(for: MenuTitle(title: ""))).to(beFalse())
                expect(result(for: SectionTitle(title: ""))).to(beFalse())
                expect(result(for: SectionMargin())).to(beFalse())
                
                expect(result(for: getCollectionItem())).to(beFalse())
                expect(result(for: getCustomItem())).to(beFalse())
                expect(result(for: SingleSelectItem(title: "", isSelected: false))).to(beFalse())
                expect(result(for: MultiSelectItem(title: "", isSelected: false))).to(beFalse())
                expect(result(for: MultiSelectToggleItem(title: "", state: .selectAll, group: "", selectAllTitle: "", deselectAllTitle: ""))).to(beFalse())
            }
        }
    }
}

private class TestCollectionItemType: CollectionItemType {
    
    static var preferredSize: CGSize { .zero }
    static var leftInset: CGFloat { 0 }
    static var rightInset: CGFloat { .zero }
    static var topInset: CGFloat { .zero }
    static var bottomInset: CGFloat { .zero }
    static var itemSpacing: CGFloat { .zero }
}

private class TestCustomItemType: CustomItemType {
    
    static let preferredSize = CGSize(width: 100, height: 400)
}
