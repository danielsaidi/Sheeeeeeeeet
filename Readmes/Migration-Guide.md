# Migration Guide

Sheeeeeeeeet 3 adds a `Menu` model that lets you create menus that you can use in many different ways, e.g. in action sheets, iOS 13 context menus, alert controllers etc.

This is much more flexible than only supporting action sheets, like we did in Sheeeeeeeeet 1 and 2. It is much easier to create and subclass menus than `ActionSheet`, which inherits `UIViewController`.


## Action sheets are now created with menus

`ActionSheet` was previously created with a list of `ActionSheetItem`s. However, with the new `Menu` and `MenuItem` models, it made no sense to keep the almost identical `ActionSheetItem`s around. As such, you must now create a menu with items, then use this menu to create an action sheet.

For the most cases, this is as simple as rewriting this:

```swift
let title = ActionSheetTitle(title: "Menu Title")
let item1 = ActionSheetItem(title: "Option 1", value: 1)
let item2 = ActionSheetLinkItem(title: "Option 2", value: "link url")
let items = [title, item1, item2]
let sheet = ActionSheet(items: items) { ... }
```

to this

```swift
let item1 = MenuItem(title: "Option 1", value: 1)
let item2 = LinkItem(title: "Option 2", value: "link url")
let menu = Menu(title: "Menu Title", items: [item1, item2])
let sheet = ActionSheet(menu: menu) { ... }
```

However, once you have a `Menu`, Sheeeeeeeeet 3 lets you use it in a bunch of ways.

For instance, you can present it directly, without creating an action sheet:

```swift
menu.presentAsActionSheet(in: vc, from: view) { ... }
```

or create an action sheet, which you then can use like you did in previous versions:

```swift
menu.toActionSheet { ... }
```

You can also bind it as an iOS 13 action sheet to any view:

```swift
menu.addAsContextMenu(to: view) { ... }
```

All in all, the `Menu` approach is a lot more flexible and lets you focus on what you want your menu to contain, rather than how it is presented.

However, there are also some mutability changes that you must be aware of.


## Menus are immutable

You create a menu with a list of items. After that, you can't change the menu model anymore. This is very different from the flexible `ActionSheet`, which you can modify a lot after its creation.

First of all, `Menu` doesn't have a select action. You just create it with items, but doesn't say what should happen when the items are tapped. You do this when you use the menu to create an action sheet, bind it to a context menu etc.

This can be a bit tricky if you want your items to modify the menu when they are tapped. For instance, consider that you want to change the title of the menu when you tap an item in an action sheet.

You can do this in many ways:

* Add this logic to the select action that you use to present or create the action sheet. This is not ideal, though, since this may not be the caller's responsibility.

* Create a `Menu` subclass (you should probably do this a lot) and let it create its own items. Then give it a `to***ActionSheet` extension function that do this, for instance:

```swift
class UserPreferencesMenu: Menu {

    init(user: User) {
        let items = user.menuItems()¨
        super.init(title: "Preferences", items: items)
    }

    func toUserPreferencesActionSheet(action: ActionSheet.SelectAction) -> ActionSheet {
        ActionSheet(menu: self) { sheet, item in
            sheet.menu.title = "Baboom!"
            action(sheet, item)
        }
    }
}

private extension User {

    func menuItems() -> [MenuItem] {
        [
            MenuItem(title: "Say baboom")),
            LinkItem(title: "Show profile settings"),
            CancelButton(title: "Cancel")
        ]
    }
}
```

* If you want to use another select action signature than `(sheet, item`, you can let your `toCustomActionSheet` function use another signature.

* You can also create your own `ActionSheet` subclasses for even more control.


## Collection items are exceptions

If you use collection items, you actually *do* specify the setup and select actions for that item. Since you may want to modify the menu or sheet when you tap items in the collection (e.g. to write how many items that are selected), you may think that the select action should refer back to the menu and modify it or its content.

However, this is not possible:

```swift
let item = CollectionItem(...)
let selectAction = // How can you do stuff with the menu before its created?
let items = [item]
let menu = Menu(title: "Title", items: items)
// You can't do stuff with the items here, since the menu is immutable
```

Do not despair - you just have to do things a bit differently, for instance:

```swift
class FriendMenu: Menu {

    init() {
        let sectionTitle = SectionTitle(title: "Pick friends", subtitle: "0 selected")
        let selectItems =  user.friends.map { $0.toMultiSelectItem() }
        let item = CollectionItem(
            itemType: Friend.self, 
            itemCount: items.count, 
            setupAction: ..., 
            selectAction: { item, index 
                let selected = selectItems.filter { $0.isSelected }.count
                sectionTitle.subtitle = "\(selected.count) selected"
            }
        )
        let cancel = CancelButton(title: "Cancel")
        super.init(items: [sectionTitle, item, cancel])
    }
}
```

As you can see, you do not modify the menu, but rather the *items* in the menu.


## Still confused?

If you still think that the menu focus is strange, or if you struggle with something, please reach out and tell me about your issues and I'll do my best to help.
