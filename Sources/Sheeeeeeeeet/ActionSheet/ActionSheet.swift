//
//  ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This is the main class in the Sheeeeeeeeet library. You can
 use it to create action sheets and present them in any view
 controller, from any source view or bar button item.
 
 
 ## Creating action sheet instances
 
 You create instances of this class by providing `init(...)`
 with the items to present and an action to call whenever an
 item is selected. If you must have an action sheet instance
 before you can setup its items (this may happen when you're
 subclassing), you can setup the items afterwards by calling
 the `setup(items:)` function.
 
 
 ## Subclassing
 
 This class can be subclassed, which is a good practice when
 you want to use your own models in a controlled way. If you
 have a podcast app, you could have a `SleepTimerActionSheet`
 that automatically sets up its `SleepTimerTime` options and
 streamlines how you work with a sleep timer.
 
 
 ## Appearance
 
 Customizing the appearance of the various action sheet item
 types in Sheeeeeeeeet (as well as of your own custom items),
 is mainly done using the iOS appearance proxy for each item
 cell type. For instance, to change the title text color for
 all `ActionSheetSelectItem` instances (including subclasses),
 type `ActionSheetSelectItem.appearance().titleColor`. It is
 also possible to set these properties for each item as well.
 
 While most appearance is modified on a cell level, some are
 not. For instance, some views in `Views` have apperances of
 their own. `ActionSheetHeaderContainerView.cornerRadius` is
 one example. This means that you can change more than cells.
 
 Action sheet insets, margins and widths are not part of the
 appearance model, but have to be changed for each sheet. If
 you want to change these values for each sheet in youer app,
 I recommend subclassing `ActionSheet` and set these values.
 
 Neither item heights are part of the appearance model. Item
 heights are instead changed by setting the static height of
 each item type, e.g. `ActionSheetTitleItem.height = 20`. It
 is not part of the cell appearance model since an item must
 know about the height before it creates any cells.
 
 
 ## Presentation
 
 You can inject a custom presenter if you want to change how
 the sheet is presented and dismissed. The default presenter
 for iPhone devices is `ActionSheetStandardPresenter`, while
 iPad devices (most often) use `ActionSheetPopoverPresenter`.
 
 
 ## Handling item selections
 
 The `selectAction` is triggered when a user taps an item in
 the action sheet. It provides you with the action sheet and
 the selected item. It is very important to use `[weak self]`
 in these action closures, to avoid memory leaks.
 
 
 ## Handling item taps
 
 Action sheets receive a call to `handleTap(on:)` every time
 an item is tapped. You can override it if you, for instance,
 want to perform any animations before calling `super`.
 */
open class ActionSheet: UIViewController {
    
    
    // MARK: - Initialization
    
    public init(
        menu: Menu,
        configuration: Configuration = .standard,
        headerConfiguration: HeaderConfiguration = .standard,
        presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping SelectAction) {
        self.menu = menu
        self.configuration = configuration
        self.headerConfiguration = headerConfiguration
        self.presenter = presenter
        selectAction = action
        super.init(nibName: nil, bundle: nil)
        setup(with: menu)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        menu = .empty
        configuration = .standard
        headerConfiguration = .standard
        presenter = ActionSheet.defaultPresenter
        selectAction = { _, _ in print("itemSelectAction is not set") }
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Setup
    
    open func setup() {
        preferredContentSize.width = preferredPopoverWidth
    }
    
    open func setupViews() {
        backgroundView.setup(in: self)
        stackView.setup(in: self)
        headerViewContainer.setup(in: self)
        itemsTableViewHeight = itemsTableView.setup(in: self, itemHandler: itemHandler, heightPriority: 900)
        buttonsTableViewHeight = buttonsTableView.setup(in: self, itemHandler: buttonHandler)
    }
    
    open func setup(items: [MenuItem]) {
        self.items = items.filter { !($0 is MenuButton) }
        buttons = items.compactMap { $0 as? MenuButton }
        reloadData()
    }
    
    open func setup(with menu: Menu) {
        var items = menu.items
        if let title = menu.title {
            items.insert(MenuTitle(title: title), at: 0)
        }
        setup(items: items)
    }
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        refresh()
    }
    
    
    // MARK: - Typealiases
    
    public typealias SelectAction = (ActionSheet, MenuItem) -> ()
    
    
    // MARK: - Init properties
    
    public var menu: Menu
    public var configuration: Configuration
    public var headerConfiguration: HeaderConfiguration
    public var presenter: ActionSheetPresenter
    public var selectAction: SelectAction
    
    
    // MARK: - Appearance
    
    public var minimumContentInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    public var preferredPopoverWidth: CGFloat = 300
    public var sectionMargins: CGFloat = 15
    
    
    // MARK: - View Properties
    
    /**
     This is a dark view that fills the entire screen behind
     the action sheet.
     */
    public let backgroundView = ActionSheetBackgroundView()
    
    let stackView = ActionSheetStackView()
    
    let headerViewContainer = ActionSheetHeaderContainerView()
    var itemsTableView = ActionSheetItemTableView()
    var buttonsTableView = ActionSheetButtonTableView()
    
    var topMargin: NSLayoutConstraint!
    var leftMargin: NSLayoutConstraint!
    var rightMargin: NSLayoutConstraint!
    var bottomMargin: NSLayoutConstraint!
    
    var headerViewContainerHeight: NSLayoutConstraint!
    var itemsTableViewHeight: NSLayoutConstraint!
    var buttonsTableViewHeight: NSLayoutConstraint!
    
    
    // MARK: - Header Properties
    
    open var headerView: UIView?
    
    
    // MARK: - Item Properties
    
    public internal(set) var items = [MenuItem]()
    
    public var itemsHeight: Double { totalHeight(for: items) }
    
    public lazy var itemHandler = ActionSheetItemHandler(actionSheet: self, itemType: .items)
    
    
    // MARK: - Button Properties
    
    public internal(set) var buttons = [MenuButton]()
    
    public var buttonsHeight: Double { totalHeight(for: buttons) }
    
    public lazy var buttonHandler = ActionSheetItemHandler(actionSheet: self, itemType: .buttons)
    
    
    // MARK: - Presentation Functions
    
    open func dismiss(completion: @escaping () -> () = {}) {
        presenter.dismiss { completion() }
    }

    open func present(in vc: UIViewController, from view: UIView?, completion: @escaping () -> () = {}) {
        ActionSheet.applyAppearance(force: false)
        refresh()
        presenter.present(sheet: self, in: vc.rootViewController, from: view, completion: completion)
    }

    open func present(in vc: UIViewController, from item: UIBarButtonItem, completion: @escaping () -> () = {}) {
        ActionSheet.applyAppearance(force: false)
        refresh()
        presenter.present(sheet: self, in: vc.rootViewController, from: item, completion: completion)
    }

    
    // MARK: - Refresh Functions
    
    open func refresh() {
        refreshHeader()
        refreshHeaderVisibility()
        refreshItems()
        refreshButtons()
        stackView.spacing = sectionMargins
        presenter.refreshActionSheet()
    }
    
    open func refreshHeader() {
        let height = headerView?.frame.height ?? 0
        headerViewContainerHeight?.constant = height
        guard let view = headerView else { return }
        headerViewContainer.addSubview(view, fill: true)
    }
    
    open func refreshHeaderVisibility() {
        let size = view.frame.size
        let hasHeader = headerView != nil
        let isPortrait = size.height > size.width
        let isVisible = hasHeader && (isPortrait || headerConfiguration.isVisibleInLandscape)
        headerViewContainer.isHidden = !isVisible
    }
    
    open func refreshItems() {
        itemsTableView.tableFooterView = createFooter()
        itemsTableViewHeight.constant = CGFloat(itemsHeight)
    }
    
    open func refreshButtons() {
        buttonsTableView.isHidden = buttons.count == 0
        buttonsTableView.tableFooterView = createFooter()
        buttonsTableViewHeight.constant = CGFloat(buttonsHeight)
    }
    
    
    // MARK: - Protected Functions
    
    open func handleTap(on item: MenuItem) {
        reloadData()
        if item.tapBehavior != .dismiss { return selectAction(self, item) }
        self.dismiss { self.selectAction(self, item) }
    }
    
    open func margin(at margin: ActionSheetMargin) -> CGFloat {
        let view: UIView! = self.view.superview ?? self.view
        switch margin {
        case .top: return margin.value(in: view, minimum: minimumContentInsets.top)
        case .left: return margin.value(in: view, minimum: minimumContentInsets.left)
        case .right: return margin.value(in: view, minimum: minimumContentInsets.right)
        case .bottom: return margin.value(in: view, minimum: minimumContentInsets.bottom)
        }
    }

    open func reloadData() {
        itemsTableView.reloadData()
        buttonsTableView.reloadData()
    }
}


// MARK: - Private Functions

private extension ActionSheet {
    
    func createFooter() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 0.1))
        view.backgroundColor = .clear
        return view
    }
    
    func totalHeight(for items: [MenuItem]) -> Double {
        items.reduce(0) { $0 + $1.actionSheetCellHeight }
    }
}
