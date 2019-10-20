# Alert Controllers

Although `Sheeeeeeeeet` was created to work around the very limited `UIAlertController`, you can still create an alert controller from a `Menu`.


## Presenting a `Menu` as an `UIAlertController`

When you have a `Menu`, you can present it as a `UIAlertController` (provided that its items can either be ignored by the controller or converted to `UIAlertAction`s):

```swift
menu.presentAsAlertController(in: self, from: view, action: ...)
```

Note that not all menu items are supported by alert controllers. If a menu can't be presented as an alert controller, the function above will fail with an error.
