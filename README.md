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


## Demo Application

This repository contains a demo application. Just open the project, then run the
`SheeeeeeeeetExample` target to try different types of action sheets.


## Install

Sheeeeeeeeet can be installed with `CocoaPods` and `Carthage`:

### CocoaPods

TBD

### Carthage

TBD


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


## Components

Sheet comes with some built in `items`, `buttons`, `titles` and `views` that can
be used to compose flexible action sheets.


### Items

Action sheet items are used to present various options to the user. Sheeeeeeeeet
comes with the following built-in item types:

* [Standard Item][ActionSheetItem]
* [Select Item][ActionSheetSelectItem]
* [Toggle Item][ActionSheetToggleItem]
* [Link Item][ActionSheetLinkItem]

To create your own item types, either inherit `ActionSheetItem` or any item type
that best suits your needs.


### Buttons

Action sheet buttons are used to discard an action sheet or to apply any changes
made within it. Sheeeeeeeeet comes with the following built-in button types:

* [OK Button][ActionSheetOkButton]
* [Cancel Button][ActionSheetCancelButton]
* [Danger Button][ActionSheetDangerButton]

To create your own button type, either inherit `ActionSheetButton` or any button
type that best suits your needs.


### Titles

Sheet comes with additional components, that can be used to add titles, sections,
headers and margins to action sheets. They are also action sheet items, but have
no interactive use:

* [Title][ActionSheetTitle]
* [Section Title][ActionSheetSectionTitle]

To add some margin above a section title, add an `ActionSheetSectionMargin` item
before the section title.


### Header View

If you set the `headerView` property of an action sheet, it will be displayed as
a floating header above the action sheet options. You can use any view you like.


## Appearance

Sheeeeeeeeet can be globally styled by using the `ActionSheetAppearance.standard`
instance. All action sheets and their items use this appearance as template when
they are created. They create their own copies, which can be customized as well.





[header-image]: Sheeeeeeeeet/SheeeeeeeeetExample/Assets/Images/title-image.png "Sheeeeeeeeeit"

[ActionSheetItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetItem.swift
[ActionSheetSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetSelectItem.swift
[ActionSheetToggleItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetToggleItem.swift
[ActionSheetLinkItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetLinkItem.swift


[ActionSheetOkButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionOkButton.swift
[ActionSheetCancelButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionCancelButton.swift
[ActionSheetDangerButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionDangerButton.swift


[ActionSheetTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetTitle.swift
[ActionSheetSectionTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetSectionTitle.swift