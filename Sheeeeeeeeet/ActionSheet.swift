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
 controller, from any source view.
 
 To create an action sheet, call the initializer with a list
 of items and an action block that should be called whenever
 an item is selected. You can also inject a custom presenter
 if you want to customize how your action sheet is presented
 and dismissed.
 
 `ActionSheet` can be subclassed, which may be nice whenever
 you use Sheeeeeeeeet in your own app, where you may have an
 app specific use case. To customize the setup step, you can
 override `setup` if you don't want to hassle with the inits.
 
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
        setItems(items)
        self.presenter = presenter
        self.itemSelectAction = action
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
    
    open var currentPresenter: ActionSheetPresenter?
    
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
            _self.itemsView.reloadData()
            _self.itemSelectAction(_self, item)
            if item.dismissesOnTap {
                _self.dismiss()
            }
        }
    }()
    
    
    // MARK: - Item Properties
    
    fileprivate(set) open var buttons = [ActionSheetButton]()
    
    fileprivate(set) open var items = [ActionSheetItem]()
    
    open func setItems(_ items: [ActionSheetItem]) {
        self.items = items.filter { !($0 is ActionSheetButton) }
        buttons = items.flatMap { $0 as? ActionSheetButton }
        itemsView.reloadData()
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
        let view = createTableView()
        view.dataSource = buttonHandler
        view.delegate = buttonHandler
        self.view.addSubview(view)
        return view
    }()

    open var headerView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()
            guard let header = headerView else { return }
            view.addSubview(header)
        }
    }

    open lazy var itemsView: UITableView = {
        let view = createTableView()
        view.dataSource = itemHandler
        view.delegate = itemHandler
        self.view.addSubview(view)
        return view
    }()
    
    
    // MARK: - Data Properties
    
    public lazy var buttonHandler: ActionSheetButtonHandler = {
        return ActionSheetButtonHandler(actionSheet: self)
    }()
    
    public lazy var itemHandler: ActionSheetItemHandler = {
        return ActionSheetItemHandler(actionSheet: self)
    }()

    
    // MARK: - Presentation Functions
    
    open func dismiss() {
        let presenter = currentPresenter ?? self.presenter
        presenter.dismiss(sheet: self)
        currentPresenter = nil
    }
    
    open func present(in vc: UIViewController, from view: UIView?) {
        present(in: vc, from: view, with: presenter)
    }
    
    open func present(
        in vc: UIViewController,
        from view: UIView?,
        with presenter: ActionSheetPresenter) {
        prepareForPresentation()
        currentPresenter = presenter
        presenter.present(sheet: self, in: vc, from: view)
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
    
    func createTableView() -> UITableView {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        tableView.cellLayoutMarginsFollowReadableWidth = false
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
