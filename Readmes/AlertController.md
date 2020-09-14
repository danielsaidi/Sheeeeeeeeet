# Alert Controllers

Although `Sheeeeeeeeet` was created to work around the very limited `UIAlertController`, Sheeeeeeeeet `Menu`s can still be presented as alert controllers.


## How to present a `Menu` as an `UIAlertController`

When you have a `Menu` instance, you can create an `UIAlertController` with `toAlertController(...)`:

```swift
let item1 = MenuItem(title: "Option 1")
let item2 = MenuItem(title: "Option 2")
let cancel = CancelButton(title: "Cancel")
let menu = Menu(title: "My menu", items: [item1, item2, cancel])
let result = menu.toAlertController { item
    print("You selected \(item.title)")
}
```

However, the easiest way is to present it directly:

```swift
menu.presentAsAlertController(in: vc, from: button) { item
    print("You selected \(item.title)")
}
```

The alert controller will be presented as a regular alert controller.


## Unsupported item types

Note that some menu item types can't be used in alert controllers. For instance, `SelectItem`s can't be used, since alert controllers are designed to be dismisses when a selection is made.

Some item types will be automatically ignored when you convert a menu to an alert controller. They are automatically omitted, without any side-effects.

Other item types can't be automatically ignored, since that would make the menu incomplete. If your menu contains such items, any attempts to present the menu as an alert controller will fail with an error.
