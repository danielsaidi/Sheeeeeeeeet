<p align="center">
    <img src ="Resources/Logo.png" width=400 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/Sheeeeeeeeet">
        <img src="https://badge.fury.io/gh/danielsaidi%2FSheeeeeeeeet.svg?style=flat" alt="Version" />
    </a>
    <img src="https://img.shields.io/cocoapods/p/Vandelay.svg?style=flat" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" alt="Swift 5.1" />
    <img src="https://badges.frapsoft.com/os/mit/mit.svg?style=flat&v=102" alt="License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## <a name="about"></a>About Sheeeeeeeeet

Sheeeeeeeeet is a Swift library that helps you create custom, fully stylable action sheets. It comes with many built-in components and can be extended with custom ones.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

A Sheeeeeeeeet action sheet can be styled to look just like a `UIAlertController` or completely different. You can also customize how it's presented and dismissed.


## Installation

### Swift Package Manager

In Xcode 11 and later, the easiest way to add Sheeeeeeeeet to your project is to use Swift Package Manager:
```
.package(url: "git@github.com:danielsaidi/Sheeeeeeeeet.git" ...)
```

### CocoaPods

If you use [CocoaPods](CocoaPods), add this line to your `Podfile` and run `pod install`:
```ruby
pod "Sheeeeeeeeet"
```

### <a name="carthage"></a>Carthage

If you use [Carthage](Carthage), add this line to your `Cartfile` then run `carthage update --platform iOS`:
```
github "danielsaidi/Sheeeeeeeeet"
```

### Manual installation

To add `Sheeeeeeeeet` to your app without a dependency manager, clone this repository and place it somewhere on disk, then add `Sheeeeeeeeet.xcodeproj` to the project and `Sheeeeeeeeet.framework` as an embedded app binary and target dependency.


## Basic example

The easiest way to create an action sheet is to specify the items and the select
action like this:

```swift
let title = ActionSheetTitle(title: "Select a value type")
let item1 = ActionSheetItem(title: "Int", value: 1)
let item2 = ActionSheetItem(title: "String", value: "Hi!")
let item3 = ActionSheetItem(title: "Car", value: Car())
let button = ActionSheetOkButton(title: "OK")
let items = [title, item1, item2, item3, button]
let sheet = ActionSheet(items: items) { sheet, item in
    if let value = item.value as? Int { print("You selected an int: \(value)") }
    if let value = item.value as? String { print("You selected a string: \(value)") }
    if let value = item.value as? Car { print("You selected a car") }
    if item is OkButton { print("You tapped the OK button") }
}
```

To present the action sheet, just call any of its `present` functions, like this:

```swift
sheet.present(in: self, from: view, completion: ...)   // or
sheet.present(in: self, from: barButtonItem, completion: ...)
```

The `from` view is optional and only used if the sheet it presented in a popover.


## <a name="advanced-example"></a>Advanced example

You can use Sheeeeeeeeet to create really basic action sheets like the one above,
as well as very competent and self-contained ones. The one above is just a start.
When you have the basics under control, check out [this example][AdvancedExample]
to see how you can take things one step further.


## <a name="item-types"></a>Item Types

Sheeeeeeeeet comes with many built-in item types, e.g. regular items, single and
multi-select items, links, collection-based items, custom items, buttons, titles
etc. For a complete list of built-in item types, [click here][Item-Types].


## <a name="appearance"></a>Appearance

Sheeeeeeeeet lets you fully customize the appearances of action sheets and their
views and items. You can change fonts, colors and images as well as item heights,
corner radius and even more. For a complete guide, [click here][Appearance].


## Specifying items after initialization

If you require a created action sheet instance to resolve which items to present
(very common when you subclass `ActionSheet`), just create a sheet with no items
then call `setup(with: items)` once its created.


## Demo App

This project contains a demo app that demonstrates basic and advanced sheets, as
well as how to handle subclassing, appearances etc. It doesn't require any setup,
but you may have to adjust its code signing if you want to run it on a device.


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
[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet
[Pod]: http://cocoapods.org/pods/Sheeeeeeeeet
[SheeeeeeeeetRef]: https://www.youtube.com/watch?v=l1dnqKGuezo

[License]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/LICENSE
[Appearance]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Appearance.md
[Item-Types]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Item-Types.md
[AdvancedExample]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Advanced-Example.md
