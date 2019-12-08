# Action Sheets

`Sheeeeeeeeet`'s `ActionSheet` used to be the most important part of the library. However, from `3.0.0` it's now one of many ways to present a `Menu`.


## Presenting a `Menu` as an `ActionSheet`

When you have a `Menu` instance, you can create an action sheet, using its `toActionSheet` function:

```swift
let menu = Menu(...)
let sheet = menu.toActionSheet(...) { sheet, item in ... }
```

You can then present the action sheet, using any of its `present` functions.

```swift
sheet.present
```

If you have to configure the action sheet in any way, you can create an action sheet instance from the menu:

```swift
menu.toActionSheet(action: ...) 
```

or use the `ActionSheet` class directly:

```swift
let sheet = ActionSheet(menu: menu) { sheet, item in
    if let value = item.value as? Int { print("You selected an int: \(value)") }
    if let value = item.value as? Car { print("You selected a car") }
    if item is OkButton { print("You tapped the OK button") }
}

// Configure your action sheet here, if you want to

sheet.present(in: vc, from: view, completion: ...)   // or
sheet.present(in: vc, from: barButtonItem, completion: ...)
```

You can also subclass `Menu` and `ActionSheet` to isolate custom logic. Have a look at the demo app for some examples.


## Style action sheets

`Sheeeeeeeeet`'s `ActionSheet`  can be extensively styled beyond their standard appearance. You can apply custom colors, fonts, margins etc.

See [this appearance and styling guide][Appearance] for more information or have a look at the demo app.
