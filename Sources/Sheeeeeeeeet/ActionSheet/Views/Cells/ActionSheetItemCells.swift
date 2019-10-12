//
//  ActionSheetItemCells.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-10-12.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/**
 This file contains item cells that do not contain any logic.
 They just exist to provide a specific cell type to which an
 appearance style cna be applied.
 
 By gathering all these classes in one single file, the cell
 namespace becomes a lot easier to grasp.
 */

open class ActionSheetButtonCell: ActionSheetItemCell {}
open class ActionSheetCancelButtonCell: ActionSheetButtonCell {}
open class ActionSheetDangerButtonCell: ActionSheetButtonCell {}
open class ActionSheetOkButtonCell: ActionSheetButtonCell {}

open class ActionSheetMultiSelectItemCell: ActionSheetSelectItemCell {}
open class ActionSheetSingleSelectItemCell: ActionSheetSelectItemCell {}

open class ActionSheetSectionMarginCell: ActionSheetItemCell {}
open class ActionSheetSectionTitleCell: ActionSheetItemCell {}
open class ActionSheetTitleCell: ActionSheetItemCell {}
