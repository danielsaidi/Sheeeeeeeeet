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

Sheeeeeeeeet helps you create customizable and stylable action sheets. It comes with many built-in item types and can be extended with custom ones.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet action sheets can be styled to look just like a `UIAlertController` or completely different. You can also customize how they are presented and dismissed.


## Installation

### <a name="spm"></a>Swift Package Manager

In Xcode 11, the easiest way to add Sheeeeeeeeet to your project is to use Swift Package Manager:
```
https://github.com/danielsaidi/Sheeeeeeeeet.git
```

### <a name="cocoapods"></a>CocoaPods

If you use [CocoaPods](CocoaPods), add this line to your `Podfile` and run `pod install`:
```ruby
pod "Sheeeeeeeeet"
```

### <a name="carthage"></a>Carthage

If you use [Carthage](Carthage), add this line to your `Cartfile` then run `carthage update --platform iOS`:
```
github "danielsaidi/Sheeeeeeeeet"
```

### <a name="manual-installation"></a>Manual installation

To add `Sheeeeeeeeet` to your app without a dependency manager, clone this repository and place it somewhere on disk, then add `Sheeeeeeeeet.xcodeproj` to your project and `Sheeeeeeeeet.framework` as an embedded app binary and target dependency.


## <a name="basic-example"></a>Basic example

The easiest way to create a basic menu is like this:

```swift
let item1 = MenuItem(title: "Int", value: 1)
let item2 = MenuItem(title: "String", value: "Hi!")
let item3 = MenuItem(title: "Car", value: Car())
let button = OkButton(title: "OK")
let items = [title, item1, item2, item3, button]
let menu = Menu(title: "Select a type", items: items)
```

### Present the menu as a custom action sheet

You can then use the menu to create an action sheet and present it like this:

```swift
let sheet = ActionSheet(menu: menu) { sheet, item in
    if let value = item.value as? Int { print("You selected an int: \(value)") }
    if let value = item.value as? String { print("You selected a string: \(value)") }
    if let value = item.value as? Car { print("You selected a car") }
    if item is OkButton { print("You tapped the OK button") }
}
sheet.present(in: vc, from: view, completion: ...)   // or
sheet.present(in: vc, from: barButtonItem, completion: ...)
```

The `from` view is optional and only used if the sheet it presented in a popover.

### Present the menu directly

You can also skip creating the sheet and just call these `Menu` functions:

```swift
let sheet = menu.presentAsCustomActionSheet(in: vc, from: view, completion: ...)   // or
let sheet = menu.presentAsCustomActionSheet(in: vc, from: barButtonItem, completion: ...)
```

If you create your own action sheet subclass that use another completion signature, you must create new completions as well. Check out the demo app; its `FoodActionSheet` uses another completion.


## <a name="item-types"></a>Item Types

Sheeeeeeeeet comes with many built-in item types, e.g. regular items, single and multi-select items, links, buttons, titles, collections, custom items etc. 

For a complete list of built-in item types, [click here][Item-Types].


## <a name="appearance"></a>Appearance

Sheeeeeeeeet lets you customize the appearances of the action sheets and their views and items. You can change fonts, colors and images as well as item heights, corner radius and more. For a complete guide, [click here][Appearance].


## <a name="advanced-example"></a>Advanced example

You can use Sheeeeeeeeet to create basic sheets like the one above, as well as very competent and self-contained ones. The above example is just a start. 

When you have the basics under control, check out [this advanced example][AdvancedExample] to see how you can take things one step further.


## Demo App

This project contains a demo app that demonstrates different types of action sheets and items, as well as how to handle subclassing, appearances etc. It doesn't require any setup, but you may have to adjust its code signing if you want to run it on a device.


## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

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
