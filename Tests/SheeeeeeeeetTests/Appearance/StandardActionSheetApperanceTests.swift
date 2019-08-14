//
//  StandardActionSheetApperanceTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import Quick
import Nimble
import UIKit

class StandardActionSheetApperanceTests: QuickSpec {
    
    override func spec() {
        
        var appearance: ActionSheetAppearance!
        
        beforeEach {
            appearance = StandardActionSheetAppearance()
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
                let standard = appearance as? StandardActionSheetAppearance
                expect(standard).toNot(beNil())
            }
        }
        
        describe("applying the standard appearance") {
            
            beforeEach {
                ActionSheet.applyAppearance(appearance)
            }
            
            it("applies colors") {
                expect(background.backgroundColor).to(equal(.color(for: .overlay)))
                expect(header.backgroundColor).to(equal(.clear))
                expect(table.separatorColor).to(equal(.color(for: .separator)))
                
                expect(item.tintColor).to(equal(.color(for: .text)))
                expect(item.titleColor).to(equal(.color(for: .text)))
                expect(item.subtitleColor).to(equal(.color(for: .text)))
                expect(selectItem.selectedIconColor).to(equal(.color(for: .text)))
                expect(selectItem.selectedTintColor).to(equal(.color(for: .text)))
                expect(selectItem.selectedTitleColor).to(equal(.color(for: .text)))
                expect(selectItem.tintColor).to(equal(.color(for: .discreteText)))
                expect(selectItem.titleColor).to(equal(.color(for: .discreteText)))
                expect(selectItem.unselectedIconColor).to(equal(.color(for: .discreteText)))
                expect(multiSelectToggle.selectAllSubtitleColor).to(equal(.color(for: .actionText)))
                expect(multiSelectToggle.deselectAllSubtitleColor).to(equal(.color(for: .actionText)))
                
                expect(cancelButton.titleColor).to(equal(.color(for: .discreteText)))
                expect(dangerButton.titleColor).to(equal(.color(for: .danger)))
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
                expect(ActionSheetSectionTitle.height).to(equal(25))
                expect(ActionSheetSectionMargin.height).to(equal(25))
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
