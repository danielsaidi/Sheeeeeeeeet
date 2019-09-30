# Menu Items

With Sheeeeeeeeet, you can create `Menu`s that can be used in various ways, e.g. in iOS 13 context menus, custom and native action sheets.

Menus contains menu items of various types, which are divided into `items`, `buttons` and `titles`. You can also create custom item types by subclassing any of the built-in types.

Menu items are converted to different types dependinc on where they are used. For instance, custom action sheets will convert them to `ActionSheetItemCell`s, while native action sheets can convert them to actions.


## Menu Item Types

Items are used to present options. Sheeeeeeeeet has the following built-in types:

* `MenuItem` - A standard menu item with a title, optional subtitle, image etc.
* `SelectItem` - A menu item that can be marked as `isSelected` and styled accordingly.
* `SingleSelectItem` - A select item that deselects all other single-select items in the same group.
* `MultiSelectItem` - A select item that doesn't deselect other select items.
* `MultiSelectItemToggle` - An item that selects/deselects all multi-select items in the same group.
* `LinkItem` - A standard menu item that renders as a link.
* `CollectionItem` - A generic item that can contain any type of items (e.g. collection view cells).
* `Custom Item` - A generic item that can use any item (e.g. custom views).

All items, including the buttons and items below, inherit `MenuItem`. Each item has a `tapBehavior`, which determines how it should behave when tapped.


## Buttons

Buttons are used to apply or discard an action sheet. Sheeeeeeeeet has the following built-in types:

* `MenuButton` - A standard button with no default behavior
* `OkButton` - A standard ok/apply button
* `CancelButton` - A standard cancel button
* `DestructiveButton` - A destructive ok/apply button

OK and destructive buttons have `MenuButton.ButtonType.ok` as value, while cancel buttons have `MenuButton.ButtonType.cancel`. You can also check a button's type e.g. `button is OkButton`.

Different presentations handle buttons differently. Custom action sheets automatically separates buttons into a separate group, while popovers just ignore cancel buttons.


## Titles

Titles are non-interactive text or spacing elements. Sheeeeeeeeet has the following built-in types:

* `MenuTitle` - A main menu item
* `SectionTitle` - Can be used to indicate that some items belong together
* `SectionMargin` - Can be used to add spacing before and after a section title

You can add title items anywhere, although some presentations may ignore them. Custom action sheets will also add a title item to the menu if it has a title, so don't use `MenuTitle` directly.


## Header Views

`ActionSheet` has a `headerView` property, which will be displayed as a floating header above the action sheet. You can use any view as a header view.

`ActionSheet` also has a `headerViewConfiguration` with which you can setup how the header view should behave in various scenarios e.g. in landscape, popovers etc.