//
//  ActionSheetAppearanceTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble
import UIKit

class ActionSheetAppearanceTests: QuickSpec {
    
    override func spec() {
        
        var appearance: ActionSheetAppearance!
        
        beforeEach {
            appearance = ActionSheetAppearance()
        }
        
        describe("standard appearance") {
            
            it("is of correct type") {
                let appearance = ActionSheetAppearance.standard
                expect(appearance).toNot(beNil())
            }
        }
        
        describe("applying the standard appearance") {
            
            beforeEach {
                ActionSheet.applyAppearance(appearance)
            }
            
            it("registers itself as the global appearance") {
                ActionSheetAppearance.global = nil
                appearance.apply()
                expect(ActionSheetAppearance.global).to(be(appearance))
            }
            
            it("applies colors") {
                expect(appearance.background.backgroundColor).to(equal(.sheetColor(.overlay)))
                expect(appearance.header.backgroundColor).to(equal(.clear))
                expect(appearance.table.separatorColor).to(equal(.sheetColor(.separator)))
                expect(appearance.table.backgroundColor).to(equal(.sheetColor(.background)))
                
                expect(appearance.item.tintColor).to(equal(.sheetColor(.text)))
                expect(appearance.item.titleColor).to(equal(.sheetColor(.text)))
                expect(appearance.item.subtitleColor).to(equal(.sheetColor(.text)))
                expect(appearance.item.disabledTitleColor).to(equal(.sheetColor(.disabledText)))
                expect(appearance.item.disabledSubtitleColor).to(equal(.sheetColor(.disabledText)))
                expect(appearance.item.disabledTintColor).to(equal(.sheetColor(.disabledText)))
                
                expect(appearance.destructiveItem.tintColor).to(equal(.sheetColor(.danger)))
                expect(appearance.destructiveItem.titleColor).to(equal(.sheetColor(.danger)))
                expect(appearance.destructiveItem.subtitleColor).to(equal(.sheetColor(.danger)))
                
                expect(appearance.selectItem.selectedIconColor).to(equal(.sheetColor(.text)))
                expect(appearance.selectItem.selectedTintColor).to(equal(.sheetColor(.text)))
                expect(appearance.selectItem.selectedTitleColor).to(equal(.sheetColor(.text)))
                expect(appearance.selectItem.tintColor).to(equal(.sheetColor(.discreteText)))
                expect(appearance.selectItem.titleColor).to(equal(.sheetColor(.discreteText)))
                expect(appearance.selectItem.unselectedIconColor).to(equal(.sheetColor(.discreteText)))
                expect(appearance.multiSelectToggle.selectAllSubtitleColor).to(equal(.sheetColor(.actionText)))
                expect(appearance.multiSelectToggle.deselectAllSubtitleColor).to(equal(.sheetColor(.actionText)))
                
                expect(appearance.secondaryAction.secondaryActionIconColor).to(equal(.sheetColor(.text)))
                
                expect(appearance.cancelButton.titleColor).to(equal(.sheetColor(.discreteText)))
                expect(appearance.destructiveItem.titleColor).to(equal(.sheetColor(.danger)))
            }
            
            it("applies corner radii") {
                expect(appearance.header.cornerRadius).to(equal(10))
                expect(appearance.table.cornerRadius).to(equal(10))
            }
            
            it("applies fonts") {
                expect(appearance.item.titleFont).to(equal(.systemFont(ofSize: 17)))
                expect(appearance.item.subtitleFont).to(equal(.systemFont(ofSize: 14)))
                expect(appearance.multiSelectToggle.titleFont).to(equal(.boldSystemFont(ofSize: 13)))
                expect(appearance.sectionTitle.titleFont).to(equal(.boldSystemFont(ofSize: 14)))
                expect(appearance.title.titleFont).to(equal(.boldSystemFont(ofSize: 15)))
                expect(appearance.button.titleFont).to(equal(.boldSystemFont(ofSize: 17)))
                expect(appearance.cancelButton.titleFont).to(equal(.systemFont(ofSize: 17)))
            }
            
            it("applies heights") {
                expect(ActionSheetItemCell.appearance().height).to(equal(50))
                expect(ActionSheetButtonCell.appearance().height).to(equal(0))
                
                expect(ActionSheetCancelButtonCell.appearance().height).to(equal(0))
                expect(ActionSheetDestructiveButtonCell.appearance().height).to(equal(0))
                expect(ActionSheetOkButtonCell.appearance().height).to(equal(0))
                
                expect(ActionSheetCollectionItemCell.appearance().height).to(equal(0))
                
                expect(ActionSheetLinkItemCell.appearance().height).to(equal(0))
                expect(ActionSheetMultiSelectItemCell.appearance().height).to(equal(0))
                expect(ActionSheetMultiSelectToggleItemCell.appearance().height).to(equal(0))
                expect(ActionSheetSelectItemCell.appearance().height).to(equal(0))
                expect(ActionSheetSingleSelectItemCell.appearance().height).to(equal(0))
                
                expect(ActionSheetTitleCell.appearance().height).to(equal(0))
                expect(ActionSheetSectionTitleCell.appearance().height).to(equal(25))
                expect(ActionSheetSectionMarginCell.appearance().height).to(equal(20))
            }
            
            it("can resolve heights recursively") {
                let standard = 50.0
                
                expect(MenuItem(title: "").actionSheetCellHeight).to(equal(standard))
                expect(MenuButton(title: "", type: .cancel).actionSheetCellHeight).to(equal(standard))
                
                expect(CancelButton(title: "").actionSheetCellHeight).to(equal(standard))
                expect(DestructiveButton(title: "").actionSheetCellHeight).to(equal(standard))
                expect(OkButton(title: "").actionSheetCellHeight).to(equal(standard))
                
                // expect(CollectionItemCell.actionSheetCellHeight).to(equal(standard))
                
                expect(LinkItem(title: "").actionSheetCellHeight).to(equal(standard))
                expect(MultiSelectItem(title: "", isSelected: true).actionSheetCellHeight).to(equal(standard))
                expect(MultiSelectToggleItem(title: "", state: .deselectAll, group: "", selectAllTitle: "", deselectAllTitle: "").actionSheetCellHeight).to(equal(standard))
                expect(SelectItem(title: "", isSelected: true).actionSheetCellHeight).to(equal(standard))
                expect(SingleSelectItem(title: "", isSelected: true).actionSheetCellHeight).to(equal(standard))
                
                expect(MenuTitle(title: "").actionSheetCellHeight).to(equal(standard))
                expect(SectionTitle(title: "").actionSheetCellHeight).to(equal(25))
                expect(SectionMargin().actionSheetCellHeight).to(equal(20))
            }
            
            it("applies icons") {
                guard #available(iOS 13.0, *) else { return }
                expect(appearance.link.linkIcon).to(equal(UIImage(systemName: "chevron.right")))
                expect(appearance.selectItem.selectedIcon).to(equal(UIImage(systemName: "checkmark")))
            }
            
            it("applies separator insets") {
                expect(appearance.item.separatorInset).to(equal(.zero))
                expect(appearance.title.separatorInset).to(equal(.hiddenSeparator))
                expect(appearance.sectionTitle.separatorInset).to(equal(.hiddenSeparator))
                expect(appearance.sectionMargin.separatorInset).to(equal(.hiddenSeparator))
                expect(appearance.multiSelectToggle.separatorInset).to(equal(.hiddenSeparator))
            }
        }
    }
}
