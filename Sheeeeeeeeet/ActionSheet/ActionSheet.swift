//
//  ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This is the main class in the Sheeeeeeeeet library. You can
 use it to create action sheets and present them in any view
 controller, from any source view or bar button item.
 
 To create an action sheet, just call the initializer with a
 list of items and buttons and a block that should be called
 whenever an item is selected.
 
 
 ## Custom presentation
 
 You can also inject a custom sheet presenter if you want to
 customize how your sheet is presented and dismissed. If you
 do not use a custom presenter, `ActionSheetDefaultPresenter`
 is used. It honors the default iOS behavior by using action
 sheets on iPhones and popovers on iPad.
 
 
 ## Subclassing
 
 `ActionSheet` can be subclassed, which may be nice whenever
 you use Sheeeeeeeeet in your own app and want to use an app
 specific domain model. For instance, if you want to present
 a list of `Food` items, you could create a `FoodActionSheet`
 subclass, that is responsible to populate itself with items.
 When you subclass `ActionSheet` you can either override the
 initializers. However, you could also just override `setup`
 and configure the action sheet in your override.
 
 
 ## Appearance
 
 Sheeeeeeeeet's action sheet appearance if easily customized.
 To change the global appearance for every action sheet that
 is used in your app, use `UIActionSheetAppearance.standard`.
 To change the appearance of a single action sheet, use it's
 `appearance` property. To change the appearance of a single
 item, use it's `appearance` property.
 
 
 ## Triggered actions
 
 `ActionSheet` has two actions that are triggered by tapping
 an item. `itemTapAction` is used by the sheet itself when a
 tap occurs on an item. You can override this if you want to,
 but you don't have to. `itemSelectAction`, however, must be
 set to detect when an item is selected after a tap. This is
 the main item action to observe, and the action you provide
 in the initializer.
 
 */

import UIKit

open class ActionSheet: UIViewController {
    
    
    // MARK: - Initialization
    
    public init(
        items: [ActionSheetItem],
        presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping SelectAction) {
        self.presenter = presenter
        itemSelectAction = action
        super.init(nibName: ActionSheet.className, bundle: Bundle(for: ActionSheet.self))
        setupItemsAndButtons(with: items)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        presenter = ActionSheet.defaultPresenter
        itemSelectAction = { _, _ in print("itemSelectAction is not set") }
        super.init(coder: aDecoder)
        setup()
    }
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Setup
    
    open func setup() {}
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        refresh()
    }
    
    
    // MARK: - Typealiases
    
    public typealias SelectAction = (ActionSheet, ActionSheetItem) -> ()
    public typealias TapAction = (ActionSheetItem) -> ()
    
    
    // MARK: - Dependencies
    
    open var appearance = ActionSheetAppearance(copy: .standard)
    
    open var presenter: ActionSheetPresenter
    
    
    // MARK: - Actions
    
    open var itemSelectAction: SelectAction
    
    open lazy var itemTapAction: TapAction = { [weak self] item in
        self?.handleTap(on: item)
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var topMargin: NSLayoutConstraint?
    @IBOutlet weak var leftMargin: NSLayoutConstraint?
    @IBOutlet weak var rightMargin: NSLayoutConstraint?
    @IBOutlet weak var bottomMargin: NSLayoutConstraint?
    
    @IBOutlet weak var backgroundView: UIView?
    @IBOutlet weak var stackView: UIStackView?
    
    @IBOutlet weak var headerViewContainer: UIView? {
        didSet { headerViewContainer?.backgroundColor = .green }
    }
    
    @IBOutlet weak var itemsTableView: UITableView? {
        didSet { setup(itemsTableView, handler: itemHandler) }
    }
    
    @IBOutlet weak var itemsTableViewHeight: NSLayoutConstraint?
    
    @IBOutlet weak var buttonsTableView: IntrinsicTableView? {
        didSet { setup(buttonsTableView, handler: buttonHandler) }
    }
    
    @IBOutlet weak var buttonsTableViewHeight: NSLayoutConstraint?
    
    
    // MARK: - Header
    
    open var headerView: UIView?
    
    
    // MARK: - Items
    
    open var items = [ActionSheetItem]()
    
    open var itemsHeight: CGFloat { return totalHeight(for: items) }
    
    open lazy var itemHandler = ActionSheetItemHandler(actionSheet: self, handles: .items)
    
    
    // MARK: - Buttons
    
    open var buttons = [ActionSheetButton]()
    
    open var buttonsHeight: CGFloat { return totalHeight(for: buttons) }
    
    open lazy var buttonHandler = ActionSheetItemHandler(actionSheet: self, handles: .buttons)
    
    
    // MARK: - Presentation Functions
    
    open func dismiss(completion: @escaping () -> ()) {
        presenter.dismiss { completion() }
    }

    open func present(in vc: UIViewController, from view: UIView?) {
        refresh()
        presenter.present(sheet: self, in: vc.rootViewController, from: view)
    }

    open func present(in vc: UIViewController, from barButtonItem: UIBarButtonItem) {
        refresh()
        presenter.present(sheet: self, in: vc.rootViewController, from: barButtonItem)
    }

    open func refresh() {
        applyRoundCorners()
        items.forEach { $0.applyAppearance(appearance) }
        itemsTableView?.separatorColor = appearance.itemsSeparatorColor
        itemsTableViewHeight?.constant = itemsHeight
        buttons.forEach { $0.applyAppearance(appearance) }
        buttonsTableView?.separatorColor = appearance.itemsSeparatorColor
        buttonsTableViewHeight?.constant = buttonsHeight
        presenter.refreshActionSheet()
    }
    
    
    // MARK: - Public Functions
    
    open func margin(at margin: ActionSheetMargin) -> CGFloat {
        let minimum = appearance.contentInset
        return margin.value(in: view.superview, minimum: minimum)
    }

    open func item(at indexPath: IndexPath) -> ActionSheetItem {
        return items[indexPath.row]
    }

    open func reloadData() {
        itemsTableView?.reloadData()
        buttonsTableView?.reloadData()
    }

    open func setupItemsAndButtons(with items: [ActionSheetItem]) {
        self.items = items.filter { !($0 is ActionSheetButton) }
        buttons = items.compactMap { $0 as? ActionSheetButton }
        reloadData()
    }
}


// MARK: - Private Functions

private extension ActionSheet {
    
    func applyRoundCorners() {
        applyRoundCorners(to: headerViewContainer)
        applyRoundCorners(to: itemsTableView)
        applyRoundCorners(to: buttonsTableView)
    }

    func applyRoundCorners(to view: UIView?) {
        view?.clipsToBounds = true
        view?.layer.cornerRadius = appearance.cornerRadius
    }
    
    func setup(_ view: UITableView?, handler: ActionSheetItemHandler) {
        view?.tableFooterView = UIView.empty
        view?.cellLayoutMarginsFollowReadableWidth = false
        view?.rowHeight = UITableView.automaticDimension
        view?.estimatedRowHeight = 44
        view?.dataSource = handler
        view?.delegate = handler
    }
    
    func totalHeight(for items: [ActionSheetItem]) -> CGFloat {
        return items.reduce(0) { $0 + $1.appearance.height }
    }

    func handleTap(on item: ActionSheetItem) {
        reloadData()
        guard item.tapBehavior == .dismiss else { return itemSelectAction(self, item) }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.dismiss { self.itemSelectAction(self, item) }
        }
    }
}
