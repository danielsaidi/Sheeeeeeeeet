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
 
 You can also inject a custom sheet presenter if you want to
 customize how your sheet is presented and dismissed. If you
 do not use a custom presenter, `ActionSheetDefaultPresenter`
 is used by deault.
 
 `ActionSheet` can be subclassed, which may be nice whenever
 you use Sheeeeeeeeet in your own app and want to use an app
 specific domain model. For instance, if you want to present
 a list of `Food` items, you could create a `FoodActionSheet`
 subclass, that is responsible to populate itself with items.
 When you subclass `ActionSheet` you can either override the
 initializers. However, you could also just override `setup`
 and configure the action sheet in your override.
 
 Sheeeeeeeeet's action sheet appearance if easily customized.
 To change the global appearance for every action sheet that
 is used in your app, use `UIActionSheetAppearance.standard`.
 To change the appearance of a single action sheet, use it's
 `appearance` property. To change the appearance of a single
 item, use it's `appearance` property.
 
 IMPORTANT: Remember to always keep a strong reference to an
 action sheet, otherwise the action sheet may be deallocated
 while the view is still presented in a crippled state.
 
 */

import UIKit

public typealias ActionSheetItemSelectAction = (ActionSheet, ActionSheetItem) -> ()
public typealias ActionSheetItemTapAction = (ActionSheetItem) -> ()


open class ActionSheet: UIViewController {
    
    
    // MARK: - Initialization
    
    public init(
        items: [ActionSheetItem],
        presenter: ActionSheetPresenter = ActionSheetDefaultPresenter(),
        action: @escaping ActionSheetItemSelectAction) {
        super.init(nibName: nil, bundle: nil)
        setupItemsAndButtons(with: items)
        self.presenter = presenter
        self.itemSelectAction = action
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    deinit { print("\(type(of: self)) deinit") }
    
    
    // MARK: - Setup
    
    open func setup() {
        view.backgroundColor = .clear
    }
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        prepareForPresentation()
    }
    
    
    // MARK: - Dependencies
    
    open lazy var appearance: ActionSheetAppearance = {
        return ActionSheetAppearance(copy: .standard)
    }()
    
    open lazy var presenter: ActionSheetPresenter = {
        return ActionSheetDefaultPresenter()
    }()
    
    
    // MARK: - Actions
    
    open lazy var itemSelectAction: ActionSheetItemSelectAction = {
        return { [weak self] sheet, item in
            print("ActionSheet.itemSelectAction not set")
        }
    }()
    
    open lazy var itemTapAction: ActionSheetItemTapAction = {
        return { [weak self] item in
            guard let _self = self else { return }
            _self.reloadData()
            _self.itemSelectAction(_self, item)
            if item.tapBehavior == .dismiss {
                _self.dismiss()
            }
        }
    }()
    
    
    // MARK: - Item Properties
    
    open var buttons = [ActionSheetButton]()
    
    open var items = [ActionSheetItem]()
    
    open func setupItemsAndButtons(with items: [ActionSheetItem]) {
        self.items = items.filter { !($0 is ActionSheetButton) }
        buttons = items.flatMap { $0 as? ActionSheetButton }
        reloadData()
    }
    
    
    // MARK: - Properties
    
    open var buttonsHeight: CGFloat {
        return buttons.reduce(0) { $0 + $1.appearance.height }
    }
    
    open var buttonsTotalHeight: CGFloat {
        return buttonsHeight
    }
    
    open var contentHeight: CGFloat {
        return headerTotalHeight + itemsTotalHeight + buttonsTotalHeight
    }
    
    open var contentWidth: CGFloat {
        return super.preferredContentSize.width
    }
    
    open var headerHeight: CGFloat {
        return headerView?.frame.height ?? 0
    }
    
    open var headerTotalHeight: CGFloat {
        guard headerHeight > 0 else { return 0 }
        return headerHeight + appearance.contentInset
    }
    
    open var itemsHeight: CGFloat {
        return items.reduce(0) { $0 + $1.appearance.height }
    }
    
    open var itemsTotalHeight: CGFloat {
        guard itemsHeight > 0 else { return 0 }
        guard buttonsTotalHeight > 0 else { return itemsHeight }
        return itemsHeight + appearance.contentInset
    }
    
    open override var preferredContentSize: CGSize {
        get { return CGSize(width: contentWidth, height: contentHeight) }
        set { super.preferredContentSize = newValue }
    }
    
    open var preferredPopoverSize: CGSize {
        let width = appearance.popover.width
        return CGSize(width: width, height: contentHeight)
    }


    // MARK: - View Properties
    
    open lazy var buttonsView: UITableView = {
        let tableView = createTableView(handler: buttonHandler)
        view.addSubview(tableView)
        return tableView
    }()

    open var headerView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()
            guard let header = headerView else { return }
            view.addSubview(header)
        }
    }
    
    open lazy var itemsView: UITableView = {
        let tableView = createTableView(handler: itemHandler)
        view.addSubview(tableView)
        return tableView
    }()
    
    
    // MARK: - Data Properties
    
    public lazy var buttonHandler: ActionSheetItemHandler = {
        return ActionSheetItemHandler(actionSheet: self, handles: .buttons)
    }()
    
    public lazy var itemHandler: ActionSheetItemHandler = {
        return ActionSheetItemHandler(actionSheet: self, handles: .items)
    }()

    
    // MARK: - Presentation Functions
    
    open func dismiss() {
        presenter.dismiss(sheet: self)
    }
    
    open func present(in vc: UIViewController, from view: UIView?) {
        prepareForPresentation()
        presenter.present(sheet: self, in: vc.rootViewController, from: view)
    }
    
    open func present(in vc: UIViewController, from barButtonItem: UIBarButtonItem) {
        prepareForPresentation()
        presenter.present(sheet: self, in: vc.rootViewController, from: barButtonItem)
    }
    
    open func prepareForPresentation() {
        items.forEach { $0.applyAppearance(appearance) }
        buttons.forEach { $0.applyAppearance(appearance) }
        applyRoundCorners()
        positionViews()
    }
    
    
    // MARK: - Public Functions
    
    public func item(at indexPath: IndexPath) -> ActionSheetItem {
        return items[indexPath.row]
    }
    
    open func reloadData() {
        itemsView.reloadData()
        buttonsView.reloadData()
    }
}


// MARK: - Private Functions

fileprivate extension ActionSheet {
    
    func applyRoundCorners() {
        applyRoundCorners(to: headerView)
        applyRoundCorners(to: itemsView)
        applyRoundCorners(to: buttonsView)
    }
    
    func applyRoundCorners(to view: UIView?) {
        view?.clipsToBounds = true
        view?.layer.cornerRadius = appearance.cornerRadius
    }
    
    func createTableView(handler: ActionSheetItemHandler) -> UITableView {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.dataSource = handler
        tableView.delegate = handler
        return tableView
    }
    
    func positionViews() {
        let width = view.frame.width
        positionHeaderView(width: width)
        positionItemsView(width: width)
        positionButtonsView(width: width)
    }
    
    func positionButtonsView(width: CGFloat) {
        buttonsView.frame.origin.x = 0
        buttonsView.frame.origin.y = headerTotalHeight + itemsTotalHeight
        buttonsView.frame.size.width = width
        buttonsView.frame.size.height = buttonsTotalHeight
    }
    
    func positionHeaderView(width: CGFloat) {
        guard let view = headerView else { return }
        view.frame.origin = .zero
        view.frame.size.width = width
    }
    
    func positionItemsView(width: CGFloat) {
        itemsView.frame.origin.x = 0
        itemsView.frame.origin.y = headerTotalHeight
        itemsView.frame.size.width = width
        itemsView.frame.size.height = itemsHeight
    }
}
