[← Back][GitHub]

# Appearance

Sheeeeeeeeet lets you fully customize the appearances of action sheets and their
views and items. You can change fonts, colors and images as well as item heights
and even more stuff.

This guide will show you which customization alternatives that are available. If
you want to see them used in action, checkout the example app and have a look at
the [advanced example][AdvancedExample].


## Important

Make sure that you setup the global appearance in a structured way, e.g. as your
app starts. If you change the global appearance many times, e.g. every time your
app presents an action sheet, your sheets may look and behave inconsistenly.


## Action sheet apperance

The `ActionSheet` class has three instance properties that you can modify:

* `minimumContentInsets: UIEdgeInsets` (the minimum screen edge margins)
* `preferredPopoverWidth: CGFloat` (the popover width, when presented on iPads)
* `sectionMargins: CGFloat` (the distance between the header, items and buttons)

Since these properties apply to each action sheet instance, you can't change the
default values for all action sheets in your app. If you want all sheets to have
a different default value, just subclass `ActionSheet` and set a custom value.


## Action sheet subview appearances

The `ActionSheet` class has various subviews, that can be styled with appearance
proxy properties.

* `ActionSheetBackgroundView`
* `ActionSheetTableView`
    * `ActionSheetButtonTableView`
    * `ActionSheetItemTableView` 
* `ActionSheetHeaderView`

To modify the appearance of these views, just use their appearance proxies, e.g.:

```swift
ActionSheetBackgroundView.appearance().backgroundColor = .purple
ActionSheetTableView.appearance().cornerRadius = 15
ActionSheetButtonTableView.appearance().cornerRadius = 20 // Otherwise 15
ActionSheetHeaderView.appearance().cornerRadius = 15
```

To modify the appearance of these views in a specific action sheet, just do this:

```swift
ActionSheetHeaderView.appearance(whenContainedInInstancesOf: [MyCustomActionSheet.self]).backgroundColor = .blue
```


## Action sheet item appearances

To modify the appearance of a specific item, just modify the appearance proxy of
it's cell(!), e.g.:

```swift
ActionSheetItemCell.appearance().titleColor = .red
```

The appearance properties are inherited down the inheritance chain, much like in
css, so changing `ActionSheetItemCell.appearance().titleColor` affects the title
color of all action sheet items and their subclasses.

The various items have the following available appearance properties:

* `ActionSheetItem`
    * `titleColor`
    * `titleFont`
    * `subtitleColor`
    * `subtitleFont`
* `ActionSheetLinkItemCell`
    * `linkIcon`
* `ActionSheetSelectItemCell`
    * `selectedIcon`
    * `selectedIconColor`
    * `selectedSubtitleColor`
    * `selectedSubtitleFont`
    * `selectedTitleColor`
    * `selectedTitleFont`
    * `selectedTintColor`
    * `unselectedIcon`
    * `unselectedIconColor`
* `ActionSheetMultiSelectToggleItem`
    * `deselectAllImage`
    * `deselectAllSubtitleColor`
    * `deselectAllTitleColor`
    * `selectAllImage`
    * `selectAllSubtitleColor`
    * `selectAllTitleColor`

If you inherit an item type, you get access to all appearance properties and the
default styling.


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