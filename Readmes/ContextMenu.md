# Context Menus

Sheeeeeeeeet `Menu`s can be added as iOS 13 context menus to any view. 


## How to present a `Menu` as a context menu

When you have a `Menu` instance, you can add it as an iOS 13 context menu to any view:

```swift
let item1 = MenuItem(title: "Option 1")
let item2 = MenuItem(title: "Option 2")
let cancel = CancelButton(title: "Cancel")
let menu = Menu(title: "My menu", items: [item1, item2, cancel])
delegate = menu.addAsContextMenu(to: view) { item
    print("You selected \(item.title)")
}
```

This creates a standard iOS 13 context menu that is applied in the standard way.


## Retaining is important

You must retain the delegate, otherwise the context menu will stop working when the delegate is automatically disposed. 

To simplify this, you can let `view` implement `ContextMenuDelegateRetainer` and use an auto-retaining version of the function:

```swift
menu.addAsRetainedContextMenu(to: view, action: ...)
```

The view will then automatically retain the delegate and release it when it's disposed.


## Unsupported item types

Note that some menu item types can't be used in context menus. For instance, `SelectItem`s can't be used, since context menus are designed to be dismisses when a selection is made.

Some item types will be automatically ignored when you convert a menu to a context menu. They are automatically omitted, without any side-effects.

Other item types can't be automatically ignored, since that would make the menu incomplete. If your menu contains such items, any attempts to present the menu as a context menu will fail with an error.

