<p align="center">
    <img src ="Resources/Logo.png" width=400 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/Sheeeeeeeeet">
        <img src="https://badge.fury.io/gh/danielsaidi%2FSheeeeeeeeet.svg?style=flat" alt="Version" />
    </a>
    <img src="https://api.travis-ci.org/danielsaidi/Sheeeeeeeeet.svg" alt="Build Status" />
    <a href="https://cocoapods.org/pods/Sheeeeeeeeet">
        <img src="https://img.shields.io/cocoapods/v/Sheeeeeeeeet.svg?style=flat" alt="CocoaPods" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/carthage-supported-green.svg?style=flat" alt="Carthage" />
    </a>
    <img src="https://img.shields.io/cocoapods/p/Sheeeeeeeeet.svg?style=flat" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-4.2-orange.svg" alt="Swift 4.2" />
    <img src="https://badges.frapsoft.com/os/mit/mit.svg?style=flat&v=102" alt="License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About Sheeeeeeeeet

Sheeeeeeeeet is a Swift library for creating custom action sheets. It comes with
some built-in items and can be extended with custom items that are more specific
to your app as well.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet can be styled to look just like normal `UIKit` action sheets or way
different. You can apply a global style and override it with an individual style
for each action sheet.

By the end of this `README.md`, this project will have you saying [Sheeeeeeeeet][SheeeeeeeeetRef]!


## Installation

### [CocoaPods](CocoaPods)

```ruby
pod 'Sheeeeeeeeet'
```

### [Carthage](Carthage)

```
github "danielsaidi/Sheeeeeeeeet"
```

### Manual installation

To add `Sheeeeeeeeet` to your app without Carthage or CocoaPods, clone this repo
and place it somewhere in your project folder. Then, add `Sheeeeeeeeet.xcodeproj`
to your project, select your app target and add the Sheeeeeeeeet framework as an
embedded binary under `General` and as a target dependency under `Build Phases`.


## Example Application

This repository contains an example app. Before you can run it, you must install 
[Carthage](Carthage) (e.g. using `brew`) and run `carthage update --platform iOS`.
You can then open the project and try out the different sheets and item types.


## Example Code

Below is a basic way to create an action sheets with `Sheeeeeeeeet`. Have a look
at the example app for more examples, e.g. multi and single select items, toggle
items, links etc.


```swift
func createStandardActionSheet() -> ActionSheet {
    let title = ActionSheetTitle(title: "Select an option")
    let item1 = ActionSheetItem(title: "Option 1", value: 1, image: image1)
    let item2 = ActionSheetItem(title: "Option 2", value: Car(), image: image2)
    let button = ActionSheetOkButton(title: "OK")
    return ActionSheet(items: items) { sheet, item in
        if let value = item.value as? Int { print("You selected the number 1") }
        if let value = item.value as? Car { print("You selected a car") }
        if item is ActionSheetOkButton { print("OK buttons has the value `true`") }
    }
}
```

In larger apps, you'll probably want to use your own domain model. All types are
a valid item values, so you can pass in anything from ints and strings to custom
types such as a `Date` or a `Car`.

To present an action sheet, you just have to call the `present` function as such:

```swift
actionSheet.present(in: self, from: view)
```

The from `view` parameter is used when a sheet is presented using a popover, e.g
on iPads. You can customize how a sheet is presented by replacing its `presenter`.


## Action Sheet Components

`Sheeeeeeeeet` contains a set of built-in components that can be used to compose
flexible sheets. To create custom items, just subclass any of the built-in types.

### Items

Action sheet items are used to present options. `Sheeeeeeeeet` has the following
built-in item types:

* [Item][ActionSheetItem] - A standard item that dismisses the sheet when tapped.
* [Single-select Item][ActionSheetSingleSelectItem] - Deselects all other single-
select items in the same group when tapped, then dismisses the sheet.
* [Multi-Select Item][ActionSheetMultiSelectItem] - Doesn't deselect other items
when tapped and doesn't dismiss the sheet.
* [Multi-Select Toggle][ActionSheetMultiSelectToggleItem] - Toggles the selected
state of all multi-select items in the same group.
* [Link Item][ActionSheetLinkItem] - Navigation links.
* [Collection Item][ActionSheetCollectionItem] - A general item with an embedded
collection view that can contain any type of cells.
* [Custom Item][ActionSheetCustomItem] - A super-flexible item, that can use any
custom view.

The standard item corresponds to a standard `UIKit` actionsheet action. It has a
title, an optional subtitle and an image. It's the base class for all other item
types, who also copies its standard appearance.

Each item type has a certain `tapBehavior`, which determines how it behaves when
it is tapped. You can always change this property to change how any item behaves. 
For instance, if you want a single-select item to not dismiss your sheet, set it
to `.none` for that item.

### Buttons

Action sheet buttons are used to apply or discard the effects of an action sheet.
`Sheeeeeeeeet` has the following built-in types:

* [OK button][ActionSheetOkButton] - OK/apply button with a `true` value
* [Cancel button][ActionSheetCancelButton] - Cancel button with a `nil` value
* [Danger button][ActionSheetDangerButton] - OK/apply button with a `danger` style

Buttons are automatically separated from other items and presented in a separate
list item. On popovers, however, they are added back to the end of the item list,
since popovers look different.

### Titles

Titles are non-interactive items. Sheeeeeeeeet comes with these built-in types:

* [Title][ActionSheetTitle] - Shown topmost for an entire sheet
* [Section Title][ActionSheetSectionTitle] - Shown topmost for a section
* [Section Margin][ActionSheetSectionMargin] - Can be added before section titles

You can add title components anywhere you want in your action sheets, although a
title probably looks best topmost, a section title probably looks best before an
item section etc.

### Header Views

If you set the `headerView` property of an action sheet, it will be displayed as
a floating header above the action sheet. You can use any view as long as it can
be resized to fit the header view size.

Header views are completely removed in popovers, since popovers are solid bodies
with no transparent background.


## Appearance

Sheets can be globally styled by using the `ActionSheetAppearance.standard`. All
action sheet items will then copy this appearance upon creation, and apply it to
all items each time it refreshes its content.

If you want to apply a global style for all your action sheets, simply style the
`ActionSheetAppearance.standard` property and all action sheets will be affected. 

If you want to apply an individual style to a single action sheet, just style it
using its `appearance` property (a copy of `ActionSheetAppearance.standard`), or
completely replace it with a completely different appearance instance.

If you want to apply an individual style to a single action sheet item, just set
its optional `customAppearance` property to any custom value. Just be careful to
copy any other appearance, otherwise you'll affect the original style.

Have a look at the example app to see how global and individual appearances work.


## Contact me

I hope you like this library. Feel free to reach out if you have questions or if
you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com](mailto:daniel.saidi@gmail.com)
* Twitter: [@danielsaidi](http://www.twitter.com/danielsaidi)
* Web site: [danielsaidi.com](http://www.danielsaidi.com)


## License

Sheeeeeeeeet is available under the MIT license. See LICENSE file for more info.


[Carthage]: https://github.com/Carthage
[CocoaPods]: http://cocoapods.org
[GitHub]: https://github.com/danielsaidi/Vandelay
[Pod]: http://cocoapods.org/pods/Vandelay
[SheeeeeeeeetRef]: https://www.youtube.com/watch?v=l1dnqKGuezo

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
