[← Back][GitHub]

# Advanced Example

Below, you'll find a little more advanced example compared to the basic one that
you have [here][BasicExample].


## Applying global appearance

Sheeeeeeeeet is customizable and lets you change the [appearance][Appearance] of
every item type and item instance, the individual height of every item type, the
separator colors of each tableview etc. For more information about the available
appearance and how to extend this model, [read more here][Appearance].

The code below applies a global style to all items, then overrides the style and
heights for certain items.

```swift
let item = ActionSheetItemCell.appearance()
item.titleColor = .darkGray
item.titleFont = .systemFont(ofSize: 15)
item.subtitleColor = .lightGray
item.subtitleFont = .systemFont(ofSize: 13)
item.titleColor = .darkGray

let title = ActionSheetTitleCell.appearance()
ActionSheetTitle.height = 60
title.titleColor = .black
title.titleFont = .systemFont(ofSize: 16)
title.separatorInset = .hiddenSeparator

let sectionTitle = ActionSheetSectionTitleCell.appearance()
SectionTitle.height = 20
sectionTitle.titleColor = .black
sectionTitle.titleFont = .systemFont(ofSize: 12)
sectionTitle.subtitleFont = .systemFont(ofSize: 12)
sectionTitle.separatorInset = .hiddenSeparator

let selectItem = ActionSheetSelectItemCell.appearance()
selectItem.selectedIcon = UIImage(named: "ic_checkmark")
selectItem.unselectedIcon = UIImage(named: "ic_empty")

let singleSelectItem = ActionSheetSingleSelectItemCell.appearance()
singleSelectItem.selectedTitleColor = .black

let multiSelectItem = ActionSheetMultiSelectItemCell.appearance()
multiSelectItem.selectedTitleColor = .green

let toggleItem = ActionSheetMultiSelectToggleItemCell.appearance()
ActionSheetMultiSelectToggleItem.height = 20
toggleItem.titleColor = .black
toggleItem.titleFont = .systemFont(ofSize: 12)
toggleItem.subtitleFont = .systemFont(ofSize: 12)
toggleItem.separatorInset = .hiddenSeparator
toggleItem.selectAllSubtitleColor = .darkGray
toggleItem.deselectAllSubtitleColor = .red

let linkItem = ActionSheetLinkItemCell.appearance()
linkItem.linkIcon = UIImage(named: "ic_arrow_right")

let button = ActionSheetButtonCell.appearance()
button.titleFont = .systemFont(ofSize: 15)

let okButton = ActionSheetOkButtonCell.appearance()
okButton.titleColor = .black

let cancelButton = ActionSheetCancelButtonCell.appearance()
cancelButton.titleColor = .lightGray
```

In your app, make sure that you modify global appearance changes in a structured
way, e.g. as the app starts. If you change global appearance in many places, the
app will behave strangely. You can instead make changes to individual sheet/item
instances, for instance:

```swift
let button = ActionSheetOkButton(title: "OK")   // Global appearance font is "15"
button.titleFont = .systemFont(ofSize: 17)
```

## Creating the action sheet

With the styling above in place, we can now create a pretty complex action sheet:

```swift
enum Time { case morning, afternoon }
enum Service { case cleaning, oiling, waxing }

let title = ActionSheetTitle(title: "Bike Service")
let section1 = ActionSheetSectionTitle(title: "Time", subtitle: "Pick one")
let item1_1 = ActionSheetSingleSelectItem(title: "Morning", subtitle: "08:00 - 12:00", isSelected: true, group: "time", value: Time.morning, tapBehavior: .none)
let item1_2 = ActionSheetSingleSelectItem(title: "Afternoon", subtitle: "13:00 - 17:00", isSelected: false, group: "time", value: Time.afternoon, tapBehavior: .none)
let margin1 = ActionSheetSectionMargin()
let section2 = ActionSheetMultiSelectToggleItem(title: "Services", state: .selectAll, group: "services", selectAllTitle: "Select all", deselectAllTitle: "Deselect all")
let item2_1 = ActionSheetMultiSelectItem(title: "Cleaning", subtitle: "$50", isSelected: true, group: "services", value: Service.cleaning)
let item2_2 = ActionSheetMultiSelectItem(title: "Oiling", subtitle: "$25", isSelected: false, group: "services", value: Service.oiling)
let item2_3 = ActionSheetMultiSelectItem(title: "Waxing", subtitle: "$25", isSelected: false, group: "services", value: Service.waxing)
let ok = ActionSheetOkButton(title: "Book Servixce")
let cancel = ActionSheetCancelButton(title: "Cancel")
let items = [title, section1, item1_1, item1_2, margin1, section2, item2_1, item2_2, item2_3, ok, cancel]
let sheet = ActionSheet(items: items) { sheet, item in
    guard item is OkButton else { return }
    let times = sheet.items.compactMap { $0 as? ActionSheetSingleSelectItem }
    let selectedTime = times.first { $0.isSelected }
    let services = sheet.items.compactMap { $0 as? ActionSheetMultiSelectItem }
    let selectedServices = services.filter { $0.isSelected }
    print("Place order with the selected time and services")
}
```

You can now present this sheet just like the sheet in the basic example. It will
behave in the same way.


## Subclassing action sheet

If you were to present this action sheet in multiple places in your app, you may
want to consider creating a specific action sheet type. In this case, the action
sheet is a bike service order sheet, so let's work with that.

We can easily do this by creating an `ActionSheet` subclass, like this:

```swift
enum Time { case morning, afternoon }
enum Service { case cleaning, oiling, waxing }

class BikeServiceActionSheet: ActionSheet {
    
    init(action: @escaping SelectAction) {
        let items = BikeServiceActionSheet.createItems()
        super.init(items: items, action: action)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var selectedTime: Time? {
        let items = self.items.compactMap { $0 as? ActionSheetSingleSelectItem }
        let selected = items.first { $0.isSelected }
        return selected?.value as? Time
    }
    
    var selectedServices: [Service] {
        let items = self.items.compactMap { $0 as? ActionSheetMultiSelectItem }
        let selected = items.filter { $0.isSelected }
        return selected.compactMap { $0.value as? Service }
    }
}

private extension BikeServiceActionSheet {
    
    static func createItems() -> [ActionSheetItem] {
        let title = ActionSheetTitle(title: "Bike Service")
        let section1 = ActionSheetSectionTitle(title: "Time", subtitle: "Pick one")
        let item1_1 = ActionSheetSingleSelectItem(title: "Morning", subtitle: "08:00 - 12:00", isSelected: true, group: "time", value: Time.morning, tapBehavior: .none)
        let item1_2 = ActionSheetSingleSelectItem(title: "Afternoon", subtitle: "13:00 - 17:00", isSelected: false, group: "time", value: Time.afternoon, tapBehavior: .none)
        let margin1 = ActionSheetSectionMargin()
        let section2 = ActionSheetMultiSelectToggleItem(title: "Services", state: .selectAll, group: "services", selectAllTitle: "Select all", deselectAllTitle: "Deselect all")
        let item2_1 = ActionSheetMultiSelectItem(title: "Cleaning", subtitle: "$50", isSelected: true, group: "services", value: Service.cleaning)
        let item2_2 = ActionSheetMultiSelectItem(title: "Oiling", subtitle: "$25", isSelected: false, group: "services", value: Service.oiling)
        let item2_3 = ActionSheetMultiSelectItem(title: "Waxing", subtitle: "$25", isSelected: false, group: "services", value: Service.waxing)
        let ok = ActionSheetOkButton(title: "Book Servixce")
        let cancel = ActionSheetCancelButton(title: "Cancel")
        return [title, section1, item1_1, item1_2, margin1, section2, item2_1, item2_2, item2_3, ok, cancel]
    }
}
```

With this in place, creating, presenting and handling the action sheet is easy:

```swift
let sheet = BikeServiceActionSheet() { sheet, item in
    guard item is OkButton else { return }
    guard let sheet = sheet as? BikeServiceActionSheet else { return }
    let selectedTime = sheet.selectedTime
    let selectedServices = sheet.selectedServices
    print("Place order with the selected time and services")
}
```

The above code is much better than the original one! We now have a custom action
sheet that sets up its own items and provides us with additional properties that
makes it a lot easier to work with the sheet.


## Subclassing action sheet items

Subclassing item types gives you more fine-grained control over the action sheet
and its content. It also makes it possible to customize the appearances for your
custom item types as well.

We can simplify the action sheet above even more, by creating two new item types:

```swift
class TimeItem: ActionSheetMultiSelectItem {
    
    var time: Time? {
        return value as? Time
    }
}

class ServiceItem: ActionSheetSingleSelectItem {
    
    var service: Service? {
        return value as? Service
    }
}
```

We can now use the new types in the action sheet, to simplify the code even more:

```swift
class BikeServiceActionSheet: ActionSheet {
    
    init(action: @escaping SelectAction) {
        let items = BikeServiceActionSheet.createItems()
        super.init(items: items, action: action)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var selectedTime: Time? {
        let items = self.items.compactMap { $0 as? TimeItem }
        let selected = items.first { $0.isSelected }
        return selected?.time
    }
    
    var selectedServices: [Service] {
        let items = self.items.compactMap { $0 as? ServiceItem }
        let selected = items.filter { $0.isSelected }
        return selected.compactMap { $0.service }
    }
}

private extension BikeServiceActionSheet {
    
    static func createItems() -> [ActionSheetItem] {
        let title = ActionSheetTitle(title: "Bike Service")
        let section1 = ActionSheetSectionTitle(title: "Time", subtitle: "Pick one")
        let item1_1 = TimeItem(title: "Morning", subtitle: "08:00 - 12:00", isSelected: true, group: "time", value: Time.morning, tapBehavior: .none)
        let item1_2 = TimeItem(title: "Afternoon", subtitle: "13:00 - 17:00", isSelected: false, group: "time", value: Time.afternoon, tapBehavior: .none)
        let margin1 = ActionSheetSectionMargin()
        let section2 = ActionSheetMultiSelectToggleItem(title: "Services", state: .selectAll, group: "services", selectAllTitle: "Select all", deselectAllTitle: "Deselect all")
        let item2_1 = ServiceItem(title: "Cleaning", subtitle: "$50", isSelected: true, group: "services", value: Service.cleaning)
        let item2_2 = ServiceItem(title: "Oiling", subtitle: "$25", isSelected: false, group: "services", value: Service.oiling)
        let item2_3 = ServiceItem(title: "Waxing", subtitle: "$25", isSelected: false, group: "services", value: Service.waxing)
        let ok = ActionSheetOkButton(title: "Book Servixce")
        let cancel = ActionSheetCancelButton(title: "Cancel")
        return [title, section1, item1_1, item1_2, margin1, section2, item2_1, item2_2, item2_3, ok, cancel]
    }
}
```

As you can see, this code is much more expressive and makes our code more robust.


## Applying custom appearance to item subclasses

If you want to customize the appearance of an item subclass, make sure that your
item type overrides `cell(for:)` and returns a unique cell type, for instance:

```swift
class TimeItem: ActionSheetSingleSelectItem {
    
    var time: Time? {
        return value as? Time
    }
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        return TimeItemCell(style: cellStyle)
    }
}

class TimeItemCell: ActionSheetSingleSelectItemCell {}
```

You can now customize your time items by modifying `TimeItemCell.appearance()`:

```swift
TimeItemCell.appearance().titleColor = .purple
```

[GitHub]: https://github.com/danielsaidi/Sheeeeeeeeet
[BasicExample]: https://github.com/danielsaidi/Sheeeeeeeeet#basic-example
