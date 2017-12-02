# Sheeeeeeeeet

[![Open Source Love](https://badges.frapsoft.com/os/mit/mit.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)
[![GitHub version](https://badge.fury.io/gh/danielsaidi%2FSheeeeeeeeet.svg)](http://badge.fury.io/gh/danielsaidi%2FSheeeeeeeeet)
[![Build Status](https://api.travis-ci.org/danielsaidi/Sheeeeeeeeet.svg)](https://travis-ci.org/danielsaidi/Sheeeeeeeeet)





![Sheeeeeeeeeit][header-image]


## About Sheeeeeeeeet

Sheeeeeeeeet is a Swift library for adding custom action sheets to your iOS apps.
It comes with a bunch of built-in item action sheet items and can be extended by
custom items that are more specific to your app or domain.

Sheeeeeeeeet action sheets can be designed to look just like standard iOS action
sheets or completely different. You can apply a global appearance style, as well
as individual styles for separate action sheets or action sheet items.

Sheeeeeeeeet action sheets can be peeked & popped on all devices that support 3D
touch, with an optional long press gesture fallback for unsupported devices.



## Demo Application

This repository contains a demo application. Open the `Sheeeeeeeeet` project and
run the `SheeeeeeeeetExample` target to try different types of action sheets.



## Install

Sheeeeeeeeet can be installed with `CocoaPods` and `Carthage`:

### CocoaPods

To add Sheeeeeeeeet to your app using CocoaPods, just create a `Podfile` in your
project root and add this line:

```
pod 'Sheeeeeeeeet'
```

After that, simply run `pod install`. For more information about using CocoaPods,
visit the [official website][CocoaPods].

### Carthage

To add Sheeeeeeeeet to your app using Carthage, just create a `Cartfile` in your
project root and add this line:

```
github "danielsaidi/Sheeeeeeeeet"
```

After that, simply run `carthage update` (with any options you prefer). For more
information about Carthage, visit the [official website][Carthage].



## Presenting an action sheet

Presenting custom action sheets with Sheeeeeeeeet is super simple. Simply create
an action sheet with a set of items, then present it in your view controller. To
support popover mode on iPad, you can also provide the sheet with a source view:

```
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

It is important to keep a strong reference to the action sheet, otherwise it may
be deallocated while being presented.



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



## Peek and pop

Sheeeeeeeeet supports peek & pop on 3D touch devices. To enable this in any view
controller that implements `ActionSheetPeekSource` just create a strong instance
of `ActionSheetPeekHandler`. You must provide it with the source view from where
peeks should originate. This could e.g. be a collection or table view.

You can use the peek handler on devices that does not support 3D touch. On these
devices, the peek handler will fallback to a long press gesture. You can disable
this by setting `longPressFallback` to `false` when creating the peek handler.



## About me

Feel free to reach out if you have any questions or if you want to contribute to
Sheeeeeeeeet:

* E-mail: [daniel.saidi@gmail.com](mailto:daniel.saidi@gmail.com)
* Twitter: [@danielsaidi](http://www.twitter.com/danielsaidi)
* Web site: [danielsaidi.com](http://www.danielsaidi.com)





[header-image]: SheeeeeeeeetExample/Assets/Images/title-image.png "Sheeeeeeeeeit"

[Carthage]: https://github.com/Carthage/Carthage
[CocoaPods]: https://cocoapods.org/

[ActionSheetItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetItem.swift
[ActionSheetSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetSelectItem.swift
[ActionSheetToggleItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetToggleItem.swift
[ActionSheetLinkItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetLinkItem.swift


[ActionSheetOkButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetOkButton.swift
[ActionSheetCancelButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetCancelButton.swift
[ActionSheetDangerButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetDangerButton.swift


[ActionSheetTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetTitle.swift
[ActionSheetSectionTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Sheeeeeeeeet/Items/ActionSheetSectionTitle.swift
