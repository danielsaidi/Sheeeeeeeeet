[← Back](GitHub)

# Use `Menu` as context menu

When you have a `Menu`, you can add it as an iOS 13 context menu to any view (provided that its items can either be ignored by the context menu or converted to `UIAction`s):

```swift
let delegate = menu.addAsContextMenu(to: view, action: ...)
```

This will make the menu work just like standard iOS 13 context menus. In fact, it creates a standard iOS 13 context menu that is applied in the standard way.

You must retain this delegate, otherwise the context menu will stop working when the delegate is disposed. To simplify this, you can let `view` implement `ContextMenuDelegateRetainer` and use an auto-retaining version of the function:

```swift
menu.addAsRetainedContextMenu(to: view, action: ...)
```

The view will then automatically retain the delegate and release it when it's disposed.

Note that not all menu items are supported by context menus. If a menu can't be used as a context menu, the delegate will crash when it tries to resolve the context menu.