<p align="center">
    <img src ="Resources/Logo.png" alt="Sheeeeeeeeet Logo" title="Sheeeeeeeeet" width=500 />
</p>

<p align="center">
<img src="https://img.shields.io/github/v/release/danielsaidi/Sheeeeeeeeet?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/cocoapods/p/Vandelay.svg?style=flat" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-5.6-orange.svg" alt="Swift 5.6" />
    <img src="https://img.shields.io/github/license/danielsaidi/Sheeeeeeeeet" alt="MIT License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About Sheeeeeeeeet

Sheeeeeeeeet lets you create menus that can be presented as custom action sheets, context menus, alert controllers, or in any way you like.

The result can look like this or completely different:

<p align="center">
    <img src ="Resources/Demo.gif" />
</p>

Sheeeeeeeeet comes with many item types (standard items, buttons, titles, toggles, etc.) and can be extended with your own custom item types.

Sheeeeeeeeet's custom action sheets can be styled to look just like a `UIAlertController` or completely different. You can also customize how they are presented and dismissed.



## Supported Platforms

Sheeeeeeeeet supports `iOS 9` and later.



## Installation

Sheeeeeeeeet can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/Sheeeeeeeeet.git
```

or with CocoaPods:

```
pod Sheeeeeeeeet
```

You can also clone the repository and build the library locally.



## Getting Started


### Creating a menu

With Sheeeeeeeeet, you start with creating a menu, like this:

```swift
let item1 = MenuItem(title: "Int", value: 1)
let item2 = MenuItem(title: "Car", value: Car())
let button = OkButton(title: "OK")
let items = [item1, item2, button]
let menu = Menu(title: "Select a type", items: items)
```

Sheeeeeeeeet has many built-in item types, e.g. buttons, select items, links, etc. A complete list can be found [here][MenuItems].

You can also [create your own custom item types][CustomItems] by inheriting any of the existing ones. For instance, if you build a car rental app, you can create a car-specific item that takes a `Car` model.

You can even create your own menu types by subclassing `Menu`. This makes it possible to create app-specific menus that provide specific functionality, handle specific tasks, etc.


### Presenting a menu as an action sheet

You can present menus as custom action sheets:

```swift
let sheet = menu.toActionSheet(...) { sheet, item in ... }
sheet.present(in: vc, from: view) { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can find more information in [this action sheet guide][ActionSheet].


### Adding a menu as a context menu

You can add menus as iOS 13 context menus to any view you like:

```swift
menu.addAsContextMenu(to: view) { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can find more information in [this context menu guide][ContextMenu].


### Presenting a menu as an alert controller

You can present menus as `UIAlertController`s:

```swift
let delegate = menu.presentAsAlertController(in: self, from: view) { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can find more information in [this alert controller guide][AlertController].



## Demo Application

This project has a demo app that demonstrates different menus and menu items, including subclassing and appearance adjustments.

To try it out, just open and run the `Sheeeeeeeeet.xcodeproj` project.



## Support

You can sponsor this project on [GitHub Sponsors][Sponsors] or get in touch for paid support. 



## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]



## License

Sheeeeeeeeet is available under the MIT license. See the LICENSE file for more info.



[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com
[Sponsors]: https://github.com/sponsors/danielsaidi

[CocoaPods]: http://cocoapods.org
[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet
[License]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/LICENSE
[Pod]: http://cocoapods.org/pods/Sheeeeeeeeet
[SheeeeeeeeetRef]: https://www.youtube.com/watch?v=l1dnqKGuezo

[ActionSheet]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ActionSheet.md
[AlertController]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/AlertController.md
[ContextMenu]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ContextMenu.md
[CustomItems]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/CustomItems.md
[MenuItems]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/MenuItems.md
