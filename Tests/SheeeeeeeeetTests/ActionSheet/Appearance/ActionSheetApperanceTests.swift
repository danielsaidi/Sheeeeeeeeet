//
//  ActionSheetApperanceTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble
import UIKit

class ActionSheetApperanceTests: QuickSpec {
    
    override func spec() {
        
        var appearance: ActionSheetAppearance!
        
        beforeEach {
            appearance = ActionSheetAppearance()
        }
        
        var background: ActionSheetBackgroundView { ActionSheetBackgroundView.appearance() }
        var button: ActionSheetButtonCell { ActionSheetButtonCell.appearance() }
        var buttonsTable: ActionSheetButtonTableView { ActionSheetButtonTableView.appearance() }
        var cancelButton: ActionSheetCancelButtonCell { ActionSheetCancelButtonCell.appearance() }
        var dangerButton: ActionSheetDangerButtonCell { ActionSheetDangerButtonCell.appearance() }
        var header: ActionSheetHeaderContainerView { ActionSheetHeaderContainerView.appearance() }
        var link: ActionSheetLinkItemCell { ActionSheetLinkItemCell.appearance() }
        var item: ActionSheetItemCell { ActionSheetItemCell.appearance() }
        var itemsTable: ActionSheetItemTableView { ActionSheetItemTableView.appearance() }
        var multiSelectItem: ActionSheetMultiSelectItemCell { ActionSheetMultiSelectItemCell.appearance() }
        var multiSelectToggle: ActionSheetMultiSelectToggleItemCell { ActionSheetMultiSelectToggleItemCell.appearance() }
        var okButton: ActionSheetOkButtonCell { ActionSheetOkButtonCell.appearance() }
        var sectionMargin: ActionSheetSectionMarginCell { ActionSheetSectionMarginCell.appearance() }
        var sectionTitle: ActionSheetSectionTitleCell { ActionSheetSectionTitleCell.appearance() }
        var selectItem: ActionSheetSelectItemCell { ActionSheetSelectItemCell.appearance() }
        var singleSelectItem: ActionSheetSingleSelectItemCell { ActionSheetSingleSelectItemCell.appearance() }
        var table: ActionSheetTableView { ActionSheetTableView.appearance() }
        var title: ActionSheetTitleCell { ActionSheetTitleCell.appearance() }
        
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
            
            it("applies colors") {
                expect(background.backgroundColor).to(equal(.sheetColor(.overlay)))
                expect(header.backgroundColor).to(equal(.clear))
                expect(table.separatorColor).to(equal(.sheetColor(.separator)))
                expect(table.backgroundColor).to(equal(.sheetColor(.background)))
                
                expect(item.tintColor).to(equal(.sheetColor(.text)))
                expect(item.titleColor).to(equal(.sheetColor(.text)))
                expect(item.subtitleColor).to(equal(.sheetColor(.text)))
                expect(selectItem.selectedIconColor).to(equal(.sheetColor(.text)))
                expect(selectItem.selectedTintColor).to(equal(.sheetColor(.text)))
                expect(selectItem.selectedTitleColor).to(equal(.sheetColor(.text)))
                expect(selectItem.tintColor).to(equal(.sheetColor(.discreteText)))
                expect(selectItem.titleColor).to(equal(.sheetColor(.discreteText)))
                expect(selectItem.unselectedIconColor).to(equal(.sheetColor(.discreteText)))
                expect(multiSelectToggle.selectAllSubtitleColor).to(equal(.sheetColor(.actionText)))
                expect(multiSelectToggle.deselectAllSubtitleColor).to(equal(.sheetColor(.actionText)))
                
                expect(cancelButton.titleColor).to(equal(.sheetColor(.discreteText)))
                expect(dangerButton.titleColor).to(equal(.sheetColor(.danger)))
            }
            
            it("applies corner radii") {
                expect(header.cornerRadius).to(equal(10))
                expect(table.cornerRadius).to(equal(10))
            }
            
            it("applies fonts") {
                expect(item.titleFont).to(equal(.systemFont(ofSize: 17)))
                expect(item.subtitleFont).to(equal(.systemFont(ofSize: 14)))
                expect(multiSelectToggle.titleFont).to(equal(.boldSystemFont(ofSize: 13)))
                expect(sectionTitle.titleFont).to(equal(.boldSystemFont(ofSize: 14)))
                expect(title.titleFont).to(equal(.boldSystemFont(ofSize: 15)))
                expect(button.titleFont).to(equal(.boldSystemFont(ofSize: 17)))
                expect(cancelButton.titleFont).to(equal(.systemFont(ofSize: 17)))
            }
            
            it("applies heights") {
                let standard = 50.0
                let title = 25.0
                
                expect(ActionSheetItemCell.appearance().height).to(equal(standard))
                expect(ActionSheetButtonCell.appearance().height).to(equal(standard))
                
                expect(ActionSheetCancelButtonCell.appearance().height).to(equal(standard))
                expect(ActionSheetDangerButtonCell.appearance().height).to(equal(standard))
                expect(ActionSheetOkButtonCell.appearance().height).to(equal(standard))
                
                expect(ActionSheetCollectionItemCell.appearance().height).to(equal(standard))
                expect(ActionSheetLinkItemCell.appearance().height).to(equal(standard))
                expect(ActionSheetMultiSelectItemCell.appearance().height).to(equal(standard))
                expect(ActionSheetMultiSelectToggleItemCell.appearance().height).to(equal(standard))
                expect(ActionSheetSelectItemCell.appearance().height).to(equal(standard))
                expect(ActionSheetSingleSelectItemCell.appearance().height).to(equal(standard))
                
                expect(ActionSheetTitleCell.appearance().height).to(equal(standard))
                expect(ActionSheetSectionTitleCell.appearance().height).to(equal(title))
                expect(ActionSheetSectionMarginCell.appearance().height).to(equal(title))
            }
            
            it("applies icons") {
                guard #available(iOS 13.0, *) else { return }
                expect(link.linkIcon).to(equal(UIImage(systemName: "chevron.right")))
                expect(selectItem.selectedIcon).to(equal(UIImage(systemName: "checkmark")))
            }
            
            it("applies separator insets") {
                expect(item.separatorInset).to(equal(.zero))
                expect(title.separatorInset).to(equal(.hiddenSeparator))
                expect(sectionTitle.separatorInset).to(equal(.hiddenSeparator))
                expect(sectionMargin.separatorInset).to(equal(.hiddenSeparator))
                expect(multiSelectToggle.separatorInset).to(equal(.hiddenSeparator))
            }
        }
    }
}
