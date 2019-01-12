//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class is used to specify the appearance for all action
 sheets and action sheet items provided by Sheeeeeeeeet. Use
 `ActionSheetAppearance.standard` to style all action sheets
 in an entire app. You can then apply individual appearances
 to individual action sheets and item types.
 
 The `item` appearance property is used as the base template
 for all other item appearances.
 
 */

import UIKit

@available(*, deprecated, message: "ActionSheetAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetAppearance {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    public init(copy: ActionSheetAppearance) {
        cornerRadius = copy.cornerRadius
        contentInset = copy.contentInset
        groupMargins = copy.groupMargins
        
        backgroundColor = copy.backgroundColor
        separatorColor = copy.separatorColor
        itemsBackgroundColor = copy.itemsBackgroundColor ?? backgroundColor
        itemsSeparatorColor = copy.itemsSeparatorColor ?? separatorColor
        buttonsSeparatorColor = copy.buttonsSeparatorColor ?? backgroundColor
        buttonsSeparatorColor = copy.buttonsSeparatorColor ?? separatorColor
        
        popover = ActionSheetPopoverAppearance(copy: copy.popover)
        
        item = ActionSheetItemAppearance(copy: copy.item)
        collectionItem = ActionSheetCollectionItemAppearance(copy: copy.collectionItem)
        customItem = ActionSheetCustomItemAppearance(copy: copy.customItem)
        linkItem = ActionSheetLinkItemAppearance(copy: copy.linkItem)
        multiSelectItem = ActionSheetMultiSelectItemAppearance(copy: copy.multiSelectItem)
        multiSelectToggleItem = ActionSheetMultiSelectToggleItemAppearance(copy: copy.multiSelectToggleItem)
        selectItem = ActionSheetSelectItemAppearance(copy: copy.selectItem)
        singleSelectItem = ActionSheetSingleSelectItemAppearance(copy: copy.singleSelectItem)
        
        cancelButton = ActionSheetCancelButtonAppearance(copy: copy.cancelButton)
        dangerButton = ActionSheetDangerButtonAppearance(copy: copy.dangerButton)
        okButton = ActionSheetOkButtonAppearance(copy: copy.okButton)
        
        sectionMargin = ActionSheetSectionMarginAppearance(copy: copy.sectionMargin)
        sectionTitle = ActionSheetSectionTitleAppearance(copy: copy.sectionTitle)
        title = ActionSheetTitleAppearance(copy: copy.title)
    }
    
    
    // MARK: - Properties
    
    @available(*, deprecated, message: "backgroundColor will be removed in 1.4.0. Use ActionSheetTableView.appearance().backgroundColor instead.")
    public var backgroundColor: UIColor?
    
    @available(*, deprecated, message: "standard will be removed in 1.4.0. Use the new appearance model instead.")
    public static var standard = ActionSheetAppearance()
    
    @available(*, deprecated, message: "buttonsBackgroundColor will be removed in 1.4.0. Use ActionSheetButtonTableView.appearance().backgroundColor instead.")
    public var buttonsBackgroundColor: UIColor?
    
    @available(*, deprecated, message: "buttonsSeparatorColor will be removed in 1.4.0. Use ActionSheetButtonTableView.appearance().separatorLineColor instead.")
    public var buttonsSeparatorColor: UIColor?
    
    @available(*, deprecated, message: "cornerRadius will be removed in 1.4.0. Use ActionSheetTableView.appearance().cornerRadius and ActionSheetHeaderView.appearance().cornerRadius instead.")
    public var cornerRadius: CGFloat?
    
    @available(*, deprecated, message: "contentInset will be removed in 1.4.0. Use ActionSheet.minimumContentInsets instead.")
    public var contentInset: CGFloat?
    
    @available(*, deprecated, message: "itemsBackgroundColor will be removed in 1.4.0. Use ActionSheetItemTableView.appearance().backgroundColor instead.")
    public var itemsBackgroundColor: UIColor?
    
    @available(*, deprecated, message: "itemsSeparatorColor will be removed in 1.4.0. Use ActionSheetItemTableView.appearance().separatorLineColor instead.")
    public var itemsSeparatorColor: UIColor?
    
    @available(*, deprecated, message: "groupMargins will be removed in 1.4.0. Use ActionSheetItemTableView.appearance().sectionMargins instead.")
    public var groupMargins: CGFloat?
    
    @available(*, deprecated, message: "separatorColor will be removed in 1.4.0. Use ActionSheetTableView.appearance().separatorLineColor instead.")
    public var separatorColor: UIColor?
    
    
    public lazy var popover = ActionSheetPopoverAppearance(width: 300)
    
    
    // MARK: - Items
    
    public lazy var item = ActionSheetItemAppearance()
    public lazy var collectionItem = ActionSheetCollectionItemAppearance(copy: item)
    public lazy var customItem = ActionSheetCustomItemAppearance(copy: item)
    public lazy var linkItem = ActionSheetLinkItemAppearance(copy: item)
    public lazy var multiSelectItem = ActionSheetMultiSelectItemAppearance(copy: selectItem)
    public lazy var multiSelectToggleItem = ActionSheetMultiSelectToggleItemAppearance(copy: item)
    public lazy var selectItem = ActionSheetSelectItemAppearance(copy: item)
    public lazy var singleSelectItem = ActionSheetSingleSelectItemAppearance(copy: selectItem)
    
    
    // MARK: - Buttons
    
    public lazy var cancelButton = ActionSheetCancelButtonAppearance(copy: item)
    public lazy var dangerButton = ActionSheetDangerButtonAppearance(copy: item)
    public lazy var okButton = ActionSheetOkButtonAppearance(copy: item)
    
    
    // MARK: - Titles
    
    public lazy var sectionMargin = ActionSheetSectionMarginAppearance(copy: item)
    public lazy var sectionTitle = ActionSheetSectionTitleAppearance(copy: item)
    public lazy var title = ActionSheetTitleAppearance(copy: item)
}
