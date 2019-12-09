//
//  ActionSheetItemCells.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-10-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/**
 This file contains item cell subclasses that don't have any
 additional logic, but just exist to provide a specific cell
 type that can have its separate appearance.
 
 By gathering all these tiny classes in one single file, the
 `Cells` namespace becomes a lot easier to grasp.
 */

open class ActionSheetButtonCell: ActionSheetItemCell {}
open class ActionSheetCancelButtonCell: ActionSheetButtonCell {}
open class ActionSheetDestructiveButtonCell: ActionSheetButtonCell {}
open class ActionSheetOkButtonCell: ActionSheetButtonCell {}

open class ActionSheetDestructiveItemCell: ActionSheetItemCell {}
open class ActionSheetMultiSelectItemCell: ActionSheetSelectItemCell {}
open class ActionSheetSingleSelectItemCell: ActionSheetSelectItemCell {}

open class ActionSheetSectionMarginCell: ActionSheetItemCell {}
open class ActionSheetSectionTitleCell: ActionSheetItemCell {}
open class ActionSheetTitleCell: ActionSheetItemCell {}
