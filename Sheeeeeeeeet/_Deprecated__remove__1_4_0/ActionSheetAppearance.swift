//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

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
    
    @available(*, deprecated, message: "ActionSheetAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    public static var standard = ActionSheetAppearance()
    
    public var backgroundColor: UIColor?
    public var buttonsBackgroundColor: UIColor?
    public var buttonsSeparatorColor: UIColor?
    public var cornerRadius: CGFloat?
    public var contentInset: CGFloat?
    public var groupMargins: CGFloat?
    public var itemsBackgroundColor: UIColor?
    public var itemsSeparatorColor: UIColor?
    public var separatorColor: UIColor?
    public lazy var popover = ActionSheetPopoverAppearance()
    
    
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
