[← Back][GitHub]

# Appearance

Sheeeeeeeeet lets you customize the appearances of action sheets and their views
and items. You can change fonts, colors and images, item heights, rounded corner
radius and much more.

This guide will show you the available customization alternatives. To learn more,
check out the demo app and this [advanced example][AdvancedExample].


## Global appearances

You must apply a global action sheet appearance in order for your sheets to look
good. You can do this at app launch by calling `ActionSheet.applyAppearance(...)`.
Apply the standard appearance by calling `ActionSheet.applyAppearance(.standard)`.
You can apply new appearances at any time.

You can inherit `ActionSheetAppearance` to create your own custom appearances. A
custom appearance can also inherit `StandardActionSheetAppearance` to build upon
the standard appearance. Have a look at the demo app for examples.


## ActionSheet apperances

The `ActionSheet` class has three appearance properties that you can modify:

* `minimumContentInsets: UIEdgeInsets` (the minimum screen edge margins)
* `preferredPopoverWidth: CGFloat` (the popover width, when presented on iPads)
* `sectionMargins: CGFloat` (the distance between the header, items and buttons)

Since these properties apply to each action sheet instance, you can't change the
default values for all action sheets in your app. If you want all sheets to have
a different value, subclass `ActionSheet` and set a custom override value.


## ActionSheet subview appearances

The `ActionSheet` class has several subviews that can be styled using appearance
proxy properties, e.g. `ActionSheetBackgroundView`. To modify the appearances of
these views, just use their appearance proxies, e.g.:

```swift
ActionSheetBackgroundView.appearance().backgroundColor = .purple
ActionSheetTableView.appearance().cornerRadius = 15
ActionSheetButtonTableView.appearance().cornerRadius = 20 // Otherwise 15
ActionSheetHeaderContainerView.appearance().cornerRadius = 15
```

To modify the appearance of these views in a specific action sheet, just do this:

```swift
ActionSheetHeaderContainerView.appearance(whenContainedInInstancesOf: [MyCustomActionSheet.self]).backgroundColor = .blue
```


## ActionSheetItem appearances

To modify the appearance of a specific item, just modify the appearance proxy of
it's cell(!), e.g.:

```swift
ActionSheetItemCell.appearance().titleColor = .red
```

Appearance properties are inherited down the inheritance chain, so if you change
the `ActionSheetItemCell.appearance().titleColor`, all item cell subclasses will
get the same title color.

If you inherit an item type, you get access to all appearance properties and the
default styling. You can extend subclasses with additional appearance properties.


## Action sheet item heights

The default action sheet item height is `50` points. You can set a custom height
for every item type, like this:

```swift
ActionSheetItem.height = 60
ActionSheetSectionMargin.height = 30
ActionSheetSectionTitle.height = 30
```

The reason why this property is not handled like the appearance proxy properties
above, is that the item must know about its height before it has created a cell.


[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet
[AdvancedExample]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Advanced-Example.md
