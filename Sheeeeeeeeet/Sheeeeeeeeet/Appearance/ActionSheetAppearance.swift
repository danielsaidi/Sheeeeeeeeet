//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetAppearance {
    
    
    // MARK: - Initialization
    
    init() {}
    
    init(copy: ActionSheetAppearance) {
        base = ActionSheetItemAppearance(copy: copy.base)
        cancelButton = ActionSheetCancelButtonAppearance(copy: copy.cancelButton)
        item = ActionSheetItemAppearance(copy: copy.item)
        linkItem = ActionSheetLinkItemAppearance(copy: copy.linkItem)
        okButton = ActionSheetOkButtonAppearance(copy: copy.okButton)
        popover = ActionSheetPopoverApperance(copy: copy.popover)
        sectionHeader = ActionSheetSectionHeaderAppearance(copy: copy.sectionHeader)
        selectItem = ActionSheetSelectItemAppearance(copy: copy.selectItem)
        title = ActionSheetTitleAppearance(copy: copy.title)
        toggleItem = ActionSheetToggleItemAppearance(copy: copy.toggleItem)
    }
    
    
    // MARK: - Properties
    
    public static var standard = ActionSheetAppearance()
    
    public lazy var base: ActionSheetItemAppearance = {
        return ActionSheetItemAppearance()
    }()
    
    public lazy var cancelButton: ActionSheetCancelButtonAppearance = {
        return ActionSheetCancelButtonAppearance(copy: base)
    }()
    
    public lazy var item: ActionSheetItemAppearance = {
        return ActionSheetItemAppearance(copy: base)
    }()
    
    public lazy var linkItem: ActionSheetLinkItemAppearance = {
        return ActionSheetLinkItemAppearance(copy: base)
    }()
    
    public lazy var okButton: ActionSheetOkButtonAppearance = {
        return ActionSheetOkButtonAppearance(copy: base)
    }()
    
    public lazy var popover: ActionSheetPopoverApperance = {
        return ActionSheetPopoverApperance(width: 300, cornerRadius: 4)
    }()
    
    public lazy var sectionHeader: ActionSheetSectionHeaderAppearance = {
        return ActionSheetSectionHeaderAppearance(copy: base)
    }()
    
    public lazy var selectItem: ActionSheetSelectItemAppearance = {
        return ActionSheetSelectItemAppearance(copy: base)
    }()
    
    public lazy var title: ActionSheetTitleAppearance = {
        return ActionSheetTitleAppearance(copy: base)
    }()
    
    public lazy var toggleItem: ActionSheetToggleItemAppearance = {
        return ActionSheetToggleItemAppearance(copy: base)
    }()
}

