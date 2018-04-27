<p align="center">
    <img src ="Resources/Logo.png" width=400 />
</p>

[![Open Source Love](https://badges.frapsoft.com/os/mit/mit.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)
[![GitHub version](https://badge.fury.io/gh/danielsaidi%2FSheeeeeeeeet.svg)](http://badge.fury.io/gh/danielsaidi%2FSheeeeeeeeet)
[![Build Status](https://api.travis-ci.org/danielsaidi/Sheeeeeeeeet.svg)](https://travis-ci.org/danielsaidi/Sheeeeeeeeet)



## About Sheeeeeeeeet

Sheeeeeeeeet is a Swift library for creating custom action sheets. It comes with
some built-in items and can be extended with custom items that are more specific
to your app as well.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet can be designed to look just like normal UIKit action sheets or way
different. You can apply a global appearance to all action sheets, then override
that global style with individual styles for each action sheet.

By the end of this `README.md`, this project will have you saying [Sheeeeeeeeet][SheeeeeeeeetRef]!


## Installation

### CocoaPods

Add this to your `Podfile`, run `pod install` then remember to use the generated
workspace afterwards:

```
pod 'Sheeeeeeeeet'
```

### Carthage

Add this to your `Cartfile`, run `carthage update` then add the framework to the
app from `Carthage/Build`:

```
github "danielsaidi/Sheeeeeeeeet"
```

### Manual

To add `Sheeeeeeeeet` to your app without Carthage or CocoaPods, clone this repo
and place it somewhere in your project folder. Then, add `Sheeeeeeeeet.xcodeproj`
to your project, select your app target and add the Sheeeeeeeeet framework as an
embedded binary under `General` and as a target dependency under `Build Phases`.


## Example Application

This repository contains an example application. Open the `Sheeeeeeeeet` project
and run the `SheeeeeeeeetExample` target to try different types of action sheets.


## Example Code

Below is a basic way to create an action sheets with `Sheeeeeeeeet`. Have a look
at the example app for more examples, e.g. multi and single select items, toggle
items, links etc.


```swift
func createStandardActionSheet() -> ActionSheet {
    let title = ActionSheetTitle(title: "Select an option")
    let item1 = ActionSheetItem(title: "Option 1", value: "1", image: image1)
    let item2 = ActionSheetItem(title: "Option 2", value: "2", image: image2)
    let button = ActionSheetOkButton(title: "OK")
    return ActionSheet(items: items) { _, item in
        guard let value = item.value as? String else { return }
        // You now have the selected value, e.g. "1". The ok button uses `true`.
    }
}
```

In a larger app, you'll probably want to use your own domain model. Any model is
a valid item `value`, which means that you can always get the raw item value for
any tapped item in a sheet.

To present an action sheet, you just have to call the `present` function as such:

```swift
actionSheet.present(in: self, from: sourceView)
```

where `sourceView` will be used when the sheet is presented using a popover, e.g.
on iPads. You can customize how a sheet is presented by replacing its `presenter`
with another implementation.


## Action Sheet Components

`Sheeeeeeeeet` comes with a large set of built-in components that can be used to
compose flexible action sheets. To create your own custom items, just inherit an
item class that best suits your needs.

### Items

Items are used to present options. Sheeeeeeeeet comes with these built-in types:

* [Standard Item][ActionSheetItem] - A standard item that dismisses the sheet when tapped
* [Single-Select Item][ActionSheetSingleSelectItem] - Deselects all other single-select items in the same group and dismisses the sheet
* [Multi-Select Item][ActionSheetMultiSelectItem] - Doesn't deselect other select items and doesn't dismiss the sheet
* [Multi-Select Toggle Item][ActionSheetMultiSelectToggleItem] - Selects/deselects all multi-select items in the same group
* [Collection Item][ActionSheetCollectionItem] - A super-flexible item with an embedded collection view
* [Link Item][ActionSheetLinkItem] - Navigation links

The standard item corresponds to a default `UIKit` action sheet action. It has a
title and an image and serve as the base class for all other item types. It uses
`.dismiss` as `tapBehavior`, which means that it dismisses the action sheet when
it is tapped. All other items inherit this standard item type and its appearance.
They can then be individually styled.

Change the value of the `tapBehavior` property to change how items behave when a
user taps them. For instance, if you want single-select items to not dismiss the
sheet when they are tapped, set their tap behavor to `.none`.

### Buttons

Buttons are used to apply or discard the effect of an action sheet. Sheeeeeeeeet
comes with these built-in types:

* [OK button][ActionSheetOkButton] - Standard OK button with a `true` value
* [Cancel button][ActionSheetCancelButton] - Standard cancel button
* [Danger button][ActionSheetDangerButton] - OK button with an alert style

Buttons are automatically separated from other items when you create your action
sheet instance, and are presented in a separate list. On popovers, however, they
are added back to the end of the item list, since popovers look different.

### Titles

Titles are non-interactive items. Sheeeeeeeeet comes with these built-in types:

* [Title][ActionSheetTitle] - Shown topmost for an entire sheet
* [Section Title][ActionSheetSectionTitle] - Shown topmost for a section
* [Section Margin][ActionSheetSectionMargin] - Should be added before section titles

You can add title components anywhere you want in your action sheets, although a
title probably looks best topmost.

### Header Views

If you set the `headerView` property of an action sheet, it will be displayed as
a floating header above the action sheet. You can use any view as long as it can
be resized to fit the header view size.

Header views are completely removed in popovers, since popovers are solid bodies
with no transparent background.


## Appearance

Sheeeeeeeeet can be globally styled by using the `ActionSheetAppearance.standard`
instance. All action sheets copies this instance when they are created. They can
then be individually styled without affecting the global style.

Have a look at the demo application to see how global and individual styling can
be setup. It's really easy.


## Contact me

I hope you like this library. Feel free to reach out if you have questions or if
you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com](mailto:daniel.saidi@gmail.com)
* Twitter: [@danielsaidi](http://www.twitter.com/danielsaidi)
* Web site: [danielsaidi.com](http://www.danielsaidi.com)


## License

Sheeeeeeeeet is available under the MIT license. See LICENSE file for more info.



[Carthage]: https://github.com/Carthage/Carthage
[CocoaPods]: https://cocoapods.org/

[ActionSheetItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetItem.swift
[ActionSheetCollectionItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetCollectionItem.swift
[ActionSheetMultiSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetMultiSelectItem.swift
[ActionSheetMultiSelectToggleItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetMultiSelectToggleItem.swift
[ActionSheetSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetSelectItem.swift
[ActionSheetSingleSelectItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetSingleSelectItem.swift
[ActionSheetLinkItem]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/ActionSheetLinkItem.swift


[ActionSheetOkButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Buttons/ActionSheetOkButton.swift
[ActionSheetCancelButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Buttons/ActionSheetCancelButton.swift
[ActionSheetDangerButton]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Buttons/ActionSheetDangerButton.swift


[ActionSheetTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Titles/ActionSheetTitle.swift
[ActionSheetSectionTitle]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Titles/ActionSheetSectionTitle.swift
[ActionSheetSectionMargin]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Sheeeeeeeeet/Items/Titles/ActionSheetSectionMargin.swift
[SheeeeeeeeetRef]: https://www.youtube.com/watch?v=l1dnqKGuezo
