//
//  DestructiveItem.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-12-09.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This item type represents a destructive menu option. Unlike
 `DestructiveButton`, it semantically represents destructive
 options, rather than a button that has a destructive effect.
 
 The item doesn't adjust any functionality from the standard
 menu item, but knowing that an item is destructive makes it
 possible to use other items or styles in lists.
 
 For instance, in an `ActionSheet`, this item is mapped to a
 separate `DestructiveActionSheetItem`, which means that you
 can style `DestructiveActionSheetItemCell` to emphasize the
 destructive nature of the item. In a context menu, the menu
 item will be marked as `destructive`. In `AlertController`s,
 the type will not have any effect.
 */
public class DestructiveItem: MenuItem {}
