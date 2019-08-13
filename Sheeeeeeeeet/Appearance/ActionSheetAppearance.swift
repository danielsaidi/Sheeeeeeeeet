//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This is the base class for all action sheet appearances.

 Just call `ActionSheet.applyAppearance(.standard)` to apply
 the standard appearance.
 
 You can inherit this class to create your own custom action
 sheet appearances. However, to avoid a lot of work, you can
 inherit `StandardActionSheetAppearance` instead and add any
 customizations to the standard appearance.
 
 To apply a custom appearance, simply call the same function
 as before, with your custom appearance as parameter instead
 of `.standard`.
 */
open class ActionSheetAppearance {
    
    public init() {}

    /**
     Apply the appearance to be used globally for all sheets.
     */
    open func apply() {}
}

public extension ActionSheetAppearance {
    
    /**
     Get an instance of the standard action sheet appearance.
     */
    static var standard: ActionSheetAppearance {
        StandardActionSheetAppearance()
    }
}

public extension ActionSheetAppearance {
    
    var background: ActionSheetBackgroundView { ActionSheetBackgroundView.appearance() }
    var buttonsTable: ActionSheetButtonTableView { ActionSheetButtonTableView.appearance() }
    var cancelButton: ActionSheetCancelButtonCell { ActionSheetCancelButtonCell.appearance() }
    var dangerButton: ActionSheetDangerButtonCell { ActionSheetDangerButtonCell.appearance() }
    var header: ActionSheetHeaderView { ActionSheetHeaderView.appearance() }
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
}
