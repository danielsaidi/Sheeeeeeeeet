# Action Sheets

Sheeeeeeeeet `Menu`s can be presented as custom action sheets. 

Custom action sheets are by default presented from the bottom of the screen on iPhone and in a popover on iPad. They support all menu item types and provides rich customization and styling possibilities.


## How to present a `Menu` as an `ActionSheet`

When you have a `Menu` instance, you can create an `ActionSheet` with `toActionSheet(...)`:

```swift
let item1 = MenuItem(title: "Option 1")
let item2 = MenuItem(title: "Option 2")
let cancel = CancelButton(title: "Cancel")
let menu = Menu(title: "My menu", items: [item1, item2, cancel])
let sheet = menu.toActionSheet { sheet, item in ...
    print("You selected \(item.title)")
}
```

You can also create an `ActionSheet` instance with the standard initializer:

```swift
let sheet = ActionSheet(menu: menu) { sheet, item in
    if let value = item.value as? Int { print("You selected an int: \(value)") }
    if let value = item.value as? Car { print("You selected a car") }
    if item is OkButton { print("You tapped the OK button") }
}
```

You can provide a custom `configuration` and `headerConfiguration` when you create an action sheet with either of these two methods. You can also provide a custom `presenter`.

You can then present the action sheet by using any of its `present` functions, for instance:

```swift
sheet.present(in: vc, from: button) {
    print("Action sheet was presented")
}
```

The sheet will be presented according to the sheet's configuration, presenter and apperance. 


## Custom types

You can subclass `Menu`, `MenuItem` and `ActionSheet`. This makes it possible to create app-specific menus and action sheets that provide specific functionality, handle specific tasks etc.  Have a look at the demo app for examples.


## Styling

`Sheeeeeeeeet`'s `ActionSheet`  can be extensively styled beyond their standard appearance. You can apply custom colors, fonts, margins etc. by modifying the appearance proxies of the various action sheet item cells, e.g. `ActionSheetSelectItemCell`. 

See [this appearance and styling guide][Appearance] for more information or have a look at the demo app.


## Advanced Example

When you have the basics under control, check out [this advanced example][Advanced] to see how you can take things further. It goes through advanced styling and customizations. 

You can also find basic and more advanced action sheet examples in the demo app.

Don't hesitate to contact me if you any need help with implementing powerful, custom action sheets in your apps. 


[Appearance]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ActionSheet-Appearance.md
[Advanced]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ActionSheet-Advanced.md
