# Appearance

`Sheeeeeeeeet`'s `ActionSheet` is very customizable and lets you change the appearance of its views and items, e.g. heights, fonts, colors, margins etc.

The action sheet classes use appearance proxy-based styling, so you can change the style of all instances of a certain item type, as well as individual instances.

This guide will show you the available customization alternatives. To learn more, check out the demo app and this [advanced example][AdvancedExample].


## Global appearance

Sheeeeeeeeet will automatically apply its standard appearance when the first action sheet is presented, if no other appearance has been applied.

This means that to customize the standard appearance, you should use a custom appearance instead of modifying appearance properties directly in code.  

For instance, if you apply your custom appearance like this:

```swift
func showSheet() {
    let view = ActionSheetTableView.appearance()
    view.backgroundColor = .red
    // The rest of the code that creates and presents your sheet
}
```

When you present the action sheet, Sheeeeeeeeet will apply its standard appearance, since no appearance has been applied. This will most probably override your changes.

The second time you call this function, Sheeeeeeeeet will NOT apply its standard appearance, since it already has done so. Yoiur changes will now override the standard appearance.

To avoid this situation, create a custom appearance instead:
```swift
class MyCustomAppearance: ActionSheetAppearance {
    override func apply() {
        super.apply()
        let view = ActionSheetTableView.appearance()
        view.backgroundColor = .red
    }
}
```
and apply it like this:

```swift
func showSheet() {
    ActionSheet.applyAppearance(MyCustomAppearance())
    // The rest of the code that creates and presents your sheet
}
```

Now, Sheeeeeeeeet will NOT apply its standard appearance, since an appearance has already already applied. 


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


[AdvancedExample]: https://github.com/danielsaidi/Sheeeeeeeeet/blob/master/Readmes/Advanced-Example.md
