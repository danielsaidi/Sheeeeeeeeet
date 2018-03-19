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

open class ActionSheetAppearance {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    public init(copy: ActionSheetAppearance) {
        cornerRadius = copy.cornerRadius
        contentInset = copy.contentInset
        
        cancelButton = ActionSheetCancelButtonAppearance(copy: copy.cancelButton)
        collectionItem = ActionSheetCollectionItemAppearance(copy: copy.collectionItem)
        dangerButton = ActionSheetDangerButtonAppearance(copy: copy.dangerButton)
        item = ActionSheetItemAppearance(copy: copy.item)
        linkItem = ActionSheetLinkItemAppearance(copy: copy.linkItem)
        okButton = ActionSheetOkButtonAppearance(copy: copy.okButton)
        popover = ActionSheetPopoverApperance(copy: copy.popover)
        sectionMargin = ActionSheetSectionMarginAppearance(copy: copy.sectionMargin)
        sectionTitle = ActionSheetSectionTitleAppearance(copy: copy.sectionTitle)
        selectItem = ActionSheetSelectItemAppearance(copy: copy.selectItem)
        singleSelectItem = ActionSheetSingleSelectItemAppearance(copy: copy.singleSelectItem)
        title = ActionSheetTitleAppearance(copy: copy.title)
        toggleItem = ActionSheetToggleItemAppearance(copy: copy.toggleItem)
    }
    
    
    // MARK: - Properties
    
    public var cornerRadius: CGFloat = 10
    
    public var contentInset: CGFloat = 15
    
    
    // MARK: - Appearance Properties
    
    public static var standard = ActionSheetAppearance()
    
    public lazy var cancelButton: ActionSheetCancelButtonAppearance = {
        return ActionSheetCancelButtonAppearance(copy: item)
    }()
    
    public lazy var collectionItem: ActionSheetCollectionItemAppearance = {
        return ActionSheetCollectionItemAppearance(copy: item)
    }()
    
    public lazy var dangerButton: ActionSheetDangerButtonAppearance = {
        let appearance = ActionSheetDangerButtonAppearance(copy: item)
        appearance.textColor = .red
        return appearance
    }()
    
    public lazy var item: ActionSheetItemAppearance = {
        return ActionSheetItemAppearance()
    }()
    
    public lazy var linkItem: ActionSheetLinkItemAppearance = {
        return ActionSheetLinkItemAppearance(copy: item)
    }()
    
    public lazy var okButton: ActionSheetOkButtonAppearance = {
        return ActionSheetOkButtonAppearance(copy: item)
    }()
    
    public lazy var popover: ActionSheetPopoverApperance = {
        return ActionSheetPopoverApperance(width: 300)
    }()
    
    public lazy var sectionTitle: ActionSheetSectionTitleAppearance = {
        return ActionSheetSectionTitleAppearance(copy: item)
    }()
    
    public lazy var sectionMargin: ActionSheetSectionMarginAppearance = {
        return ActionSheetSectionMarginAppearance(height: 20)
    }()
    
    public lazy var selectItem: ActionSheetSelectItemAppearance = {
        return ActionSheetSelectItemAppearance(copy: item)
    }()
    
    public lazy var singleSelectItem: ActionSheetSingleSelectItemAppearance = {
        return ActionSheetSingleSelectItemAppearance(copy: selectItem)
    }()
    
    public lazy var title: ActionSheetTitleAppearance = {
        return ActionSheetTitleAppearance(copy: item)
    }()
    
    public lazy var toggleItem: ActionSheetToggleItemAppearance = {
        return ActionSheetToggleItemAppearance(copy: item)
    }()
}
