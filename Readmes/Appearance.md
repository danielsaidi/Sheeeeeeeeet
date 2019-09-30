[← Back](GitHub)

# Appearance

Sheeeeeeeeet's action sheets are very customizable and let you change the appearance of their views and items, e.g. heights, fonts, colors etc.

The actiom sheets use appearance proxy-based styling, so you can change the style of all instances of a certain item type, as well as individual instances.

This guide will show you the available customization alternatives. To learn more, check out the demo app and this [advanced example][AdvancedExample].


## Global appearance

You must apply a global action sheet appearance in order for your custom action sheets to look good. You can apply the standard appearance by calling `ActionSheet.applyAppearance(.standard)`.

You can inherit `ActionSheetAppearance` to create custom appearances. If you do, remember to call `super` when overriding the standard implementations.


## ActionSheet apperances

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

`NOTE` since the cell height is not applied like other appearance properties, it's not inherited. You must therefore customize each cell type individually.


[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet
[AdvancedExample]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Advanced-Example.md
