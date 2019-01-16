[← Back][GitHub]

# Item types

Sheeeeeeeeet contains many different item types, that can be used to create very
flexible action sheets. They are divided into `Items`, `Buttons` and `Titles`.

To create custom item types, just subclass any of the built-in types. If an item
type's appearance should be customizable, make sure that it overrides `cell(for:)`
and returns a custom cell type that inherits the correct superclass.


## Items

Items are used to present options. Sheeeeeeeeet has the following built-in types:

* [Item][ActionSheetItem] - A standard item that dismisses the sheet when tapped.
* [Single-select Item][ActionSheetSingleSelectItem] - Deselects all other single-
select items in the same group and by default dismisses the sheet.
* [Multi-Select Item][ActionSheetMultiSelectItem] - Doesn't deselect other items
and does not dismiss the sheet.
* [Multi-Select Toggle][ActionSheetMultiSelectToggleItem] - Toggles the selected
state of all multi-select items in the same group.
* [Link Item][ActionSheetLinkItem] - Renders as a link, but behaves like regular
action sheet items.
* [Collection Item][ActionSheetCollectionItem] - A general item with an embedded
collection view that can contain any type of cells.
* [Custom Item][ActionSheetCustomItem] - A super-flexible item, that can use any
custom view.

The base [item][ActionSheetItem] corresponds to standard iOS `UIAlertController`
action items. It has a title, an optional subtitle and an image. All other items
are based on this item, either directly or indirectly.

Each item has a `tapBehavior`, which determines how it behaves when it is tapped.
Some item types use `.dismiss` as default, while others use `.none`. You can set
this property to any value on any item.


## Buttons

Buttons are used to apply or discard the effect of an action sheet. Sheeeeeeeeet
has the following built-in types:

* [OK button][ActionSheetOkButton] - A standard ok/apply button
* [Cancel button][ActionSheetCancelButton] - A standard cancel button
* [Danger button][ActionSheetDangerButton] - A dangerous ok/apply button

OK buttons have `ActionSheetButton.ButtonType.ok` as value, while cancel buttons
have `ActionSheetButton.ButtonType.cancel`. You can also always check the tapped
item's value for `isOkButton` and `isCancelButton` if you need to determine what
the action should do.

Buttons are automatically separated from other items and presented in a separate
list item. On popovers, however, they are added back to the end of the item list.


## Titles

Titles are non-interactive text or space items. Sheeeeeeeeet has these following
built-in types:

* [Title][ActionSheetTitle] - Shown topmost for an entire sheet
* [Section Title][ActionSheetSectionTitle] - Shown topmost for a section
* [Section Margin][ActionSheetSectionMargin] - Can embed a section title

You can add title items anywhere in your sheets, although a title probably looks
best topmost, a section title before an item section etc.


## Header Views

If you set the `headerView` property of an action sheet, it will be displayed as
a floating header above the action sheet. You can use any view as a header view.

Header views are completely removed in popovers, since popovers are solid bodies
with no transparent background.

[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet

[ActionSheetItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetItem.swift
[ActionSheetCollectionItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetCollectionItem.swift
[ActionSheetCustomItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetCustomItem.swift
[ActionSheetMultiSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetMultiSelectItem.swift
[ActionSheetMultiSelectToggleItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetMultiSelectToggleItem.swift
[ActionSheetSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetSelectItem.swift
[ActionSheetSingleSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetSingleSelectItem.swift
[ActionSheetLinkItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Items/ActionSheetLinkItem.swift

[ActionSheetOkButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Buttons/ActionSheetOkButton.swift
[ActionSheetCancelButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Buttons/ActionSheetCancelButton.swift
[ActionSheetDangerButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Buttons/ActionSheetDangerButton.swift

[ActionSheetTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Titles/ActionSheetTitle.swift
[ActionSheetSectionTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Titles/ActionSheetSectionTitle.swift
[ActionSheetSectionMargin]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Titles/ActionSheetSectionMargin.swift