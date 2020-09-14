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

Sheeeeeeeeet lets you create menus that can be presented as iOS 13 context menus, custom action sheets, alert controllers or in any way you like.

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet comes with many item types (standard items, buttons, titles, toggles etc.) and can be extended with your own custom item types.

Sheeeeeeeeet's custom action sheets can be styled to look just like a `UIAlertController` or completely different. You can also customize how they are presented and dismissed.


## Installation

### <a name="spm"></a>Swift Package Manager

```
https://github.com/danielsaidi/Sheeeeeeeeet.git
```

### <a name="cocoapods"></a>CocoaPods

```ruby
pod "Sheeeeeeeeet"
```


## Creating a menu

With Sheeeeeeeeet, you start with creating a menu, like this:

```swift
let item1 = MenuItem(title: "Int", value: 1)
let item2 = MenuItem(title: "Car", value: Car())
let button = OkButton(title: "OK")
let items = [item1, item2, button]
let menu = Menu(title: "Select a type", items: items)
```

Sheeeeeeeeet has many built-in item types, e.g. buttons, select items, links etc. A complete list can be found [here][Menu-Items].

You can also create your own custom item types by inheriting any of the existing ones. For instance, if you build a car rental app, you can create a car-specific item that takes a `Car` model.

You can even create your own menu types by subclassing `Menu`. This makes it possible to create app-specific menus that provide specific functionality, handle specific tasks etc.


## Present a menu as an action sheet

You can present menus as custom action sheets:

```swift
let sheet = menu.toActionSheet(...) { sheet, item in ... }
sheet.present(in: vc, from: view) { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can find more information in [this action sheet guide][ActionSheet].


## Add a menu as a context menu

You can add menus as iOS 13 context menus to any view you like:

```swift
menu.addAsContextMenu(to: view) { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can find more information in [this context menu guide][ContextMenu].


## Present the menu as an alert controller

You can present menus as `UIAlertController`s:

```swift
let delegate = menu.presentAsAlertController(in: self, from: view) { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can find more information in [this alert controller guide][AlertController].


## Demo App

This repository contains a demo app that demonstrates different menus and menu items, including subclassing and appearance adjustments. 

To try it out, open and run the `Sheeeeeeeeet.xcodeproj` project.


## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]


## License

Sheeeeeeeeet is available under the MIT license. See LICENSE file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com

[Carthage]: https://github.com/Carthage
[CocoaPods]: http://cocoapods.org
[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet
[License]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/LICENSE
[Pod]: http://cocoapods.org/pods/Sheeeeeeeeet
[SheeeeeeeeetRef]: https://www.youtube.com/watch?v=l1dnqKGuezo

[ActionSheet]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ActionSheet.md
[AlertController]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/AlertController.md
[ContextMenu]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ContextMenu.md
[Menu-Items]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Menu-Items.md
