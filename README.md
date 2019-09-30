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

Sheeeeeeeeet helps you create menus that can be used as context menus and action sheets. It comes with many item types (standard items, buttons, titles, toggles etc.) and can be extended with custom ones.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet action sheets can be styled to look just like a `UIAlertController` or completely different. You can also customize how they are presented and dismissed.



--- 

## **Sheeeeeeeeet 3 migration guide**

Sheeeeeeeeet 3 contains many breaking changes, but once you understand the model changes, you will hopefully see the improvements it brings and be able to migrate your apps pretty easily. See [this migration guide](Migration-Guide) for help.

---


## Installation

### <a name="spm"></a>Swift Package Manager

The easiest way to add Sheeeeeeeeet to your project is to use SPM in Xcode 11:
```
https://github.com/danielsaidi/Sheeeeeeeeet.git
```

### <a name="cocoapods"></a>CocoaPods

```ruby
pod "Sheeeeeeeeet"
```

### <a name="carthage"></a>Carthage

```
github "danielsaidi/Sheeeeeeeeet"
```

### <a name="manual-installation"></a>Manual installation

To manually add `Sheeeeeeeeet` to your app, clone this repository, add `Sheeeeeeeeet.xcodeproj` to your project and `Sheeeeeeeeet.framework` as an embedded app binary and target dependency.


## <a name="item-types"></a>Menu items

Sheeeeeeeeet comes with many built-in menu item types, e.g. regular and selectable items, links, buttons, titles, collections, custom items etc. You find a complete list, [here][Item-Types].


## <a name="basic-example"></a>Basic example

With Sheeeeeeeeet, you start off by creating a menu, like this:

```swift
let item1 = MenuItem(title: "Int", value: 1)
let item2 = MenuItem(title: "Car", value: Car())
let button = OkButton(title: "OK")
let items = [item1, item2, button]
let menu = Menu(title: "Select a type", items: items)
```

### Present the menu as an action sheet

If you don't need to configure the action sheet, you can present it directly from the menu:

```swift
let sheet = menu.presentAsActionSheet(in: vc, from: view, completion: ...)   // or
let sheet = menu.presentAsActionSheet(in: vc, from: barButtonItem, completion: ...)
```

If you need to configure the action sheet, you can create an action sheet instance with the menu:

```swift
let sheet = ActionSheet(menu: menu) { sheet, item in
    if let value = item.value as? Int { print("You selected an int: \(value)") }
    if let value = item.value as? Car { print("You selected a car") }
    if item is OkButton { print("You tapped the OK button") }
}
// Configure your action sheet here
sheet.present(in: vc, from: view, completion: ...)   // or
sheet.present(in: vc, from: barButtonItem, completion: ...)
```

The action sheets can be extensively styled. For a complete guide, [see this guide][Appearance] or have a look at the demo app.


### Add the menu as a context menu

The menu can be added as an iOS 13 context menu to any view (provided that its items can either be ignored by the context menu or converted to `UIAction`s):

```swift
let delegate = menu.addAsContextMenu(to: view, action: ...)
```

You must retain this delegate, otherwise the context menu will stop working when the delegate is disposed.

If the view implements `ContextMenuDelegateRetainer`, you can use an auto-retaining version of the function:

```swift
menu.addAsRetainedContextMenu(to: view, action: ...)
```

The view will then automatically retain the delegate and release it when it's disposed.


### Present the menu as an alert controller

The menu can be presented as a `UIAlertController` (provided that its items can either be ignored by the controller or converted to `UIAlertAction`s):

```swift
let delegate = menu.presentAsAlertController(in: self, from: view, action: ...)
```


## <a name="advanced-example"></a>Advanced example

When you have the basics under control, check out [this advanced example][Advanced-Example] to see how you can take things further.


## Demo App

This repo contains a demo app that demonstrates different types of menus and use cases (present menus as action sheet and context menu etc.), as well as how to handle subclassing, appearances etc.


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
[License]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/LICENSE
[Pod]: http://cocoapods.org/pods/Sheeeeeeeeet
[SheeeeeeeeetRef]: https://www.youtube.com/watch?v=l1dnqKGuezo

[Advanced-Example]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Advanced-Example.md
[Appearance]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Appearance.md
[Item-Types]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Item-Types.md
[Migration-Guide]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Migration-Guide.md
