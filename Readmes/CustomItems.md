# Custom Menu Items

`Sheeeeeeeeet` can be extended with custom menu item types.

If you want to use entire custom views, you can use the built-in `CustomItem` to use custom `UIView`s in a custom action sheet. The demo app shows you how to do this.

However, `CustomItem` can be pretty complicated to setup and requires custom `xib` files.

Instead, you can inherit any of the built-in item types and make it use any custom item cell when you present them in a custom action sheet.

For instance, the custom type below inherits the standard `MenuItem` base class and makes it use another cell type:

```swift
class MultilineItem: MenuItem {

    override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        DemoMultilineItemCell(style: actionSheetCellStyle)
    }
    
    override var actionSheetCellType: ActionSheetItemCell.Type {
        DemoMultilineItemCell.self
    }
}
```

The custom cell type inherits the standard `ActionSheetItemCell` base class and enables multiline support when it's refreshed:

```swift
class MultilineItemCell: ActionSheetItemCell {
    
    override func refresh() {
        super.refresh()
        textLabel?.numberOfLines = 0
    }
}
```

You can then also adjust the cell's appearance to make it appear taller than other cells

```swift
class CustomAppearance: ActionSheetAppearance {
    
    override func apply() {
        super.apply()
        MultilineItemCell.appearance().height = 100
    }
```
