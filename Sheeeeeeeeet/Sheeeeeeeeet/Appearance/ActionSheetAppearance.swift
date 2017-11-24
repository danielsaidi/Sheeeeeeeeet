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
    
    public lazy var base: ItemAppearance = {
        return ItemAppearance()
    }()
    
    public lazy var cancelButton: CancelButtonAppearance = {
        return CancelButtonAppearance(template: base)
    }()
    
    public lazy var linkItem: LinkItemAppearance = {
        return LinkItemAppearance(template: base)
    }()
    
    public lazy var okButton: OkButtonAppearance = {
        return OkButtonAppearance(template: base)
    }()
    
    public lazy var sectionHeader: SectionHeaderAppearance = {
        return SectionHeaderAppearance(template: base)
    }()
    
    public lazy var sectionSpacer: SectionSpacerAppearance = {
        return SectionSpacerAppearance(height: 20)
    }()
    
    public lazy var selectItem: SelectItemAppearance = {
        return SelectItemAppearance(template: base)
    }()
    
    public lazy var title: TitleAppearance = {
        return TitleAppearance(template: base)
    }()
}

