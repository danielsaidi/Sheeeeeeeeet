# Sheeeeeeeeet

![Sheeeeeeeeeit][header-image]


## About

Sheeeeeeeeet is a Swift library for adding custom action sheets to your iOS apps.
It comes with many built-in item action sheet item types, and can be extended by
custom types are more specific to your app or domain.

Sheeeeeeeeet action sheets can be designed to look just like standard iOS action
sheets or completely differently. It's completely up to you to design the action
sheets that are used in your application.

Sheeeeeeeeet action sheets can be peeked & popped on all devices that support 3D
touch. An optional fallback to long press is available.


## Presenting an action sheet

Presenting custom action sheets with Sheeeeeeeeet is super-simple. Simply create
an action sheet with a set of items, then present it in your view controller. To
support popover on iPad, you can also present the sheet from a certain view.

This is a short example on how to present an action sheet with three items:

```
// Do this in any view controller

func showAlert(tappedButton: UIView?) {

    let items = [
        ActionSheetTitle(title: "Select your favorite number"),
        ActionSheetItem(title: "One", value: 1, image: UIImage(named: "one"))
        ActionSheetItem(title: "Two", value: 2, image: UIImage(named: "two"))
        ActionSheetItem(title: "42", value: 42, image: UIImage(named: "42"))
        ActionSheetCancelButton(title: "Cancel")
    ]

    // Remember to keep a string reference to the action sheet!
    self.actionSheet = ActionSheet(items: items) { (sheet, item) in
        guard item.value as? Bool == true else { return }
        let items = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
        let toggled = items.filter { $0.isToggled }
        self.alert(items: toggled)
    }

    actionSheet.present(in: self, from: tappedButton)
}
```

There are a many different items and components that you can use in Sheeeeeeeeet:


## Items

Action sheet items are used to present various options to the user. Sheeeeeeeeet
comes with the following built-in item types:

* [Standard Item](#ActionSheetItem)


<a name="ActionSheetItem"></a>
### Standard Item - `ActionSheetItem`

This class represents a regular action sheet item, like the
ones used in UIAlertController. It has a title, an optional
value and an optional image. All other item classes inherit
this class.

The default tap behavior of an action sheet item is to tell
the action sheet that it was tapped, then dismiss the sheet.
If you don't want the item to dismiss the action sheet, you
can set the `tapBehavior` property to `none`.

An action sheet item's appearance is set by the sheet, when
it is presented. To use custom appearances for single items,
just modify the item's `appearance` property.

### Select Item - `ActionSheetSelectItem`

Select items are used to let the user select one or several
items in an action sheet.

The default behavior is to automatically dismiss the action
sheet. To disable this behavior, set `tapBehavior` to `none`
for every item, then add a button that dismisses the sheet.

### Toggle Item - `ActionSheetToggleItem`

Toggle items are used to enable and disable certain options
in an action sheet. They are preferrably used together with
a button that applies any changes made by the user. As such,
toggle items have `tapBehavior` set to `none` by default.

### Link Item - `ActionSheetLinkItem`

Link items can be used when tapping them will take the user
somewhere, e.g. to another view controller or a web site.


## Buttons

Action sheet buttons are used to discard an action sheet or to apply any changes
made within it. Sheeeeeeeeet comes with the following built-in button types:

### OK Button - `ActionSheetOkButton`

OK buttons have no special behavior, but can be used when a
user should apply action sheet changes by tapping an button.
The value of an OK button is `true` by default.

### Cancel Button - `ActionSheetCancelButton`

Cancel buttons have no special behavior, but can be used in
sheets where a user applies changes by tapping an OK button.
The value of a cancel button is `nil` by default.

### Danger Button - `ActionSheetCancelButton`

Danger buttons have no special behavior, but can be used to
indicate that the effect of the action sheet is destructive.
The value of a danger button is `true` by default.


## Other components

Sheet comes with additional components, that can be used to add titles, sections,
headers and margins to action sheets. They are also action sheet items, but have
no interactive use:

### Title - `ActionSheetTitle`

Title items can be used to add main titles to action sheets.
They are not selectable, but will still send a tap event to
the action sheet in which they are used.

### Section Title - `ActionSheetSectionTitle`

Section title items can be used to split action sheets into
separate sections. They are not selectable, but will send a
tap event to the action sheet in which they are used.

To add additional space above a section title, make sure to
add a `ActionSheetSectionMargin` before the section title.

### Header View

If you set the `headerView` property of an action sheet, it will be displayed as
a floating header above the action sheet options. You can use any view you like.









[header-image]: Sheeeeeeeeet/SheeeeeeeeetExample/Assets/Images/title-image.png "Sheeeeeeeeeit"