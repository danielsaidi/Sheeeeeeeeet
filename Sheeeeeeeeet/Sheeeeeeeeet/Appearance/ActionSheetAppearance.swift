//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetAppearance {
    
    
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

