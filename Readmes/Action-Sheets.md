[← Back](GitHub)

# Present `Menu` as `ActionSheet`

When you have a `Menu`, you can present it as a custom action sheet:

```swift
menu.presentAsActionSheet(in: vc, from: view, action: ...)   // or
menu.presentAsActionSheet(in: vc, from: barButtonItem, action: ...)
```

These action sheets can be extensively styled beyond their standard appearance. See [this appearance and styling guide][Appearance] for more information or have a look at the demo app.

If you need to configure the action sheet, you can create an action sheet instead of presenting one:

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

You can also subclass `Menu` and `ActionSheet` to isolate item logic, customize the select action signature etc. Have a look at the demo app for some examples.