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
a collection of built-in items and can be extended with your own custom items.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet can be styled to look just like normal `UIAlertController`s, or way
different. You can apply a global style that applies to all sheets then override
it for each action sheet. You can also apply custom styles to specific items.


## Installation

### [CocoaPods](CocoaPods)

Add this to your `Podfile` then run `pod install`:

```ruby
pod 'Sheeeeeeeeet'
```

Remember to use the generated workspace (not the project file) after installing.

### [Carthage](Carthage)

Add this to your `Cartfile` then run `carthage update --platform iOS`:

```
github "danielsaidi/Sheeeeeeeeet"
```

Once the update completes, link in the built framework from `Carthage/Build`.


### Manual installation

To add `Sheeeeeeeeet` to your app without Carthage or CocoaPods, clone this repo
and place it somewhere in your project folder. Then, add `Sheeeeeeeeet.xcodeproj`
to your project and add `Sheeeeeeeeet.framework` as an embedded app binary under
`General` and as a target dependency under `Build Phases`.


## Creating and presenting an action sheet

To create an action sheet, just specify its items and callback action, like this:

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

To present the action sheet, just call any of its `present` functions, like this:

```swift
actionSheet.present(in: self, from: view)   // or
actionSheet.present(in: self, from: barButtonItem)
```

The `from` view will only be used if the action sheet it presented in a popover.

### Domain-specific action sheets

When you use `Sheeeeeeeeet` in your apps, you may want the items to represent an
app domain-specific type, e.g. a `Movie`, or an app-specific list options. Since
the item value is of `Any` type, you can use any type or enum as value.

### Specifying items after initialization

If you require a created action sheet instance to resolve which items to present
(very common when you subclass `ActionSheet`), just create a sheet with no items
then call `setup(with:)` once its created.

If you create a domain-specific action sheet, like a `CarPickerActionSheet`, you
may have to use an injected dependency to load some data before you can populate
your sheet with items. If the dependency is initializer injected, you first have
to create the sheet with an empty item collection, then load the data using your
injected dependency, then map the data to items, then finally inject these items
into the sheet, using the `setup(with:)` approach described above.


## Example Application

This repository contains an example app. Before you can run it, you must install 
[Carthage](Carthage) (e.g. using `brew`) and run `carthage update --platform iOS`.
You can then open the project and try out the different sheets and item types.


## Action Sheet Components

`Sheeeeeeeeet` contains a set of built-in components that can be used to compose
flexible sheets. To create custom items, just subclass any of the built-in types.

### Items

Action sheet items are used to present options. `Sheeeeeeeeet` has the following
built-in item types:

* [Item][ActionSheetItem] - A standard item that dismisses the sheet when tapped.
* [Single-select Item][ActionSheetSingleSelectItem] - Deselects all other single-
select items in the same group when tapped. and by default dismisses the sheet.
* [Multi-Select Item][ActionSheetMultiSelectItem] - Doesn't deselect other items
when tapped and doesn't dismiss the sheet.
* [Multi-Select Toggle][ActionSheetMultiSelectToggleItem] - Toggles the selected
state of all multi-select items in the same group.
* [Link Item][ActionSheetLinkItem] - Renders as a link, but behaves like regular
action sheet items.
* [Collection Item][ActionSheetCollectionItem] - A general item with an embedded
collection view that can contain any type of cells.
* [Custom Item][ActionSheetCustomItem] - A super-flexible item, that can use any
custom view.

The standard item corresponds to a standard `UIKit` actionsheet action. It has a
title, an optional subtitle and an image. It's the base class for all other item
types, who also copies its standard appearance.

Every item has a `tapBehavior`, that determines how the item behaves when tapped.
Some item types use `.dismiss` as default, while others use `.none`. You can set
this property to any value on any item.

### Buttons

Action sheet buttons are used to apply or discard an action sheet. `Sheeeeeeeeet`
has the following built-in button types:

* [OK button][ActionSheetOkButton] - A standard ok/apply button
* [Cancel button][ActionSheetCancelButton] - A standard cancel button
* [Danger button][ActionSheetDangerButton] - A dangerous ok/apply button

OK buttons have `ActionSheetButton.ButtonType.ok` as value, while cancel buttons
have `ActionSheetButton.ButtonType.cancel`. You can always check the tapped item
for `isOkButton` and `isCancelButton` as well, if you need to determine what the
selection action should do.

Buttons are automatically separated from other items and presented in a separate
list item. On popovers, however, they are added back to the end of the item list.

### Titles

Titles are non-interactive text or space items. `Sheeeeeeeeet` has the following
built-in title types:

* [Title][ActionSheetTitle] - Shown topmost for an entire sheet
* [Section Title][ActionSheetSectionTitle] - Shown topmost for a section
* [Section Margin][ActionSheetSectionMargin] - Can embed a section title

You can add title components anywhere you want in your action sheets, although a
title probably looks best topmost, a section title before an item section etc.

### Header Views

If you set the `headerView` property of an action sheet, it will be displayed as
a floating header above the action sheet. You can use any view as a header view.

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
