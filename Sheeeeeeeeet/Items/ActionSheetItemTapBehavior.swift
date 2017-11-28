//
//  ActionSheetItemTapBehavior.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Action sheet items can have different behavior when tapped.
 The default behavior for most item types is to dismiss the
 action sheet when they're tapped. However, some should not.
 
 Any item's default tap behavior can be changed if needs be.
 Just set the tapBehavior property to your desired behavior.
 
 */

import UIKit

public enum ActionSheetItemTapBehavior {

    case dismiss, none
}
