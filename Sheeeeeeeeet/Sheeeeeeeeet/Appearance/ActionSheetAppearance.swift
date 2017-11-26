//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 TODO - Documentation
 
 */

import UIKit

public class ActionSheetAppearance {
    
    
    // MARK: - Initialization
    
    init() {}
    
    init(template: ActionSheetAppearance) {
        base = ActionSheetItemAppearance(template: template.base)
        cancelButton = ActionSheetCancelButtonAppearance(template: template.cancelButton)
        item = ActionSheetItemAppearance(template: template.item)
        linkItem = ActionSheetLinkItemAppearance(template: template.linkItem)
        okButton = ActionSheetOkButtonAppearance(template: template.okButton)
        popover = ActionSheetPopoverApperance(template: template.popover)
        sectionHeader = ActionSheetSectionHeaderAppearance(template: template.sectionHeader)
        selectItem = ActionSheetSelectItemAppearance(template: template.selectItem)
        title = ActionSheetTitleAppearance(template: template.title)
    }
    
    
    // MARK: - Properties
    
    public static var standard = ActionSheetAppearance()
    
    public lazy var base: ActionSheetItemAppearance = {
        return ActionSheetItemAppearance()
    }()
    
    public lazy var cancelButton: ActionSheetCancelButtonAppearance = {
        return ActionSheetCancelButtonAppearance(template: base)
    }()
    
    public lazy var item: ActionSheetItemAppearance = {
        return ActionSheetItemAppearance(template: base)
    }()
    
    public lazy var linkItem: ActionSheetLinkItemAppearance = {
        return ActionSheetLinkItemAppearance(template: base)
    }()
    
    public lazy var okButton: ActionSheetOkButtonAppearance = {
        return ActionSheetOkButtonAppearance(template: base)
    }()
    
    public lazy var popover: ActionSheetPopoverApperance = {
        return ActionSheetPopoverApperance(width: 300, cornerRadius: 4)
    }()
    
    public lazy var sectionHeader: ActionSheetSectionHeaderAppearance = {
        return ActionSheetSectionHeaderAppearance(template: base)
    }()
    
    public lazy var selectItem: ActionSheetSelectItemAppearance = {
        return ActionSheetSelectItemAppearance(template: base)
    }()
    
    public lazy var title: ActionSheetTitleAppearance = {
        return ActionSheetTitleAppearance(template: base)
    }()
}

