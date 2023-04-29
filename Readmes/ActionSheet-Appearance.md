# Action Sheet Appearance

`Sheeeeeeeeet`'s `ActionSheet` is very customizable and lets you change the appearance of its views and items, e.g. heights, fonts, colors, margins etc. It uses appearance proxies, so you can change the style of all instances of a certain item type, as well as individual instances.

This guide will show you the available customization alternatives. To learn more, check out the demo app and this [advanced example][AdvancedExample].


## Global appearance

Sheeeeeeeeet will automatically apply a standard appearance when the first action sheet is presented, if no custom appearance has been applied before that.

To apply a custom appearance, create a class that inherits `ActionSheetAppearance`, for instance:

```swift
class MyCustomAppearance: ActionSheetAppearance {
    override func apply() {
        super.apply()
        let view = ActionSheetTableView.appearance()
        view.backgroundColor = .red
    }
}
```

You can then apply the appearance as a global appearance like this:

```swift
ActionSheet.applyAppearance(MyCustomAppearance())
```

Now, Sheeeeeeeeet will not apply a standard appearance when the next sheet is presented, since a custom global appearance has been applied. 


## ActionSheet appearances

The `ActionSheet` class has some appearance properties that applies to the action sheet's layout:

* `minimumContentInsets: UIEdgeInsets` (the minimum screen edge margins)
* `preferredPopoverWidth: CGFloat` (the popover width, when presented on iPads)
* `sectionMargins: CGFloat` (the distance between the header, items and buttons)

These properties currenly apply to each action sheet instance, so you currently can't change the default values for all action sheets instances in your app.


## ActionSheet subview appearances

The `ActionSheet` class has several subviews that can be globally styled, e.g. `ActionSheetBackgroundView`. To modify their appearances, just use their appearance proxies:

```swift
ActionSheetBackgroundView.appearance().backgroundColor = .purple
ActionSheetTableView.appearance().cornerRadius = 15
ActionSheetButtonTableView.appearance().cornerRadius = 20 // Otherwise 15
ActionSheetHeaderContainerView.appearance().cornerRadius = 15
```


## ActionSheetItemCell appearances

`MenuItem`s are mapped to `ActionSheetItemCell`s (or subclasses) when they are presented in an action sheet. To modify their appearances, just modify the cells' appearance proxies:

```swift
ActionSheetItemCell.appearance().titleColor = .red
ActionSheetOPkButtonCell.appearance().titleColor = .red
```

Appearance proxy properties are inherited, so if you change `ActionSheetItemCell.appearance().titleColor`, all subclasses get the same color if you don't override it for a certain subclass.


## Action sheet item heights

The default action sheet cell height is `50` points, with `25` for some title items. You can set a custom height for every item type, like this:

```swift
ActionSheetItemCell.appearance().height = 60
ActionSheetSectionMarginCell.appearance().height = 30
```

`NOTE` Cell heights are not applied like other appearance properties, since it's not inherited. You must customize each cell type individually.


[AdvancedExample]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/ActionSheet-Advanced.md
