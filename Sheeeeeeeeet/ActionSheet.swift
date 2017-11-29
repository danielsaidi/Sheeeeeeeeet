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
        presenter: ActionSheetPresenter = DefaultActionSheetPresenter(),
        action: @escaping ActionSheetItemSelectAction) {
        super.init(nibName: nil, bundle: nil)
        self.items = items.filter { !($0 is ActionSheetButton) }
        self.buttons = items.flatMap { $0 as? ActionSheetButton }
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
    
    open var itemSelectAction: ActionSheetItemSelectAction!
    
    open lazy var itemTapAction: ActionSheetItemTapAction! = {
        return { [weak self] item in
            guard let _self = self else { return }
            _self.itemTableView.reloadData()
            _self.itemSelectAction(_self, item)
            if item.dismissesOnTap {
                _self.dismiss()
            }
        }
    }()
    
    open var presenter: ActionSheetPresenter!
    
    
    
    // MARK: - Properties
    
    open var buttons = [ActionSheetButton]()
    
    open lazy var appearance: ActionSheetAppearance = {
        let standard = ActionSheetAppearance.standard
        return ActionSheetAppearance(copy: standard)
    }()
    
    open var contentHeight: CGFloat {
        let itemHeight = items.reduce(0) { $0 + $1.appearance.height }
        guard let view = headerView else { return itemHeight }
        let headerHeight = view.frame.height
        return itemHeight + headerHeight + appearance.headerView.bottomMargin
    }
    
    open var items = [ActionSheetItem]()
    
    open override var preferredContentSize: CGSize {
        get {
            let width = super.preferredContentSize.width
            return CGSize(width: width, height: contentHeight)
        }
        set { super.preferredContentSize = newValue }
    }
    
    open var preferredPopoverSize: CGSize {
        let width = appearance.popover.width
        return CGSize(width: width, height: contentHeight)
    }
    
    
    // MARK: - Private Properties
    
    fileprivate lazy var tableViewDataSource: ActionSheetItemDataSource = {
        return ActionSheetItemDataSource(actionSheet: self)
    }()
    
    fileprivate lazy var tableViewDelegate: ActionSheetItemDelegate = {
        return ActionSheetItemDelegate(actionSheet: self)
    }()


    // MARK: - View Properties

    open var headerView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()
            guard let header = headerView else { return }
            view.addSubview(header)
        }
    }

    open lazy var itemTableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableView.cellLayoutMarginsFollowReadableWidth = false
        view.addSubview(tableView)
        return tableView
    }()

    
    // MARK: - Presentation Functions
    
    open func dismiss() {
        presenter.dismiss(sheet: self)
    }
    
    open func pop(in vc: UIViewController, from view: UIView?) {
        prepareForPresentation()
        presenter.pop(sheet: self, in: vc, from: view)
    }
    
    open func present(in vc: UIViewController, from view: UIView?) {
        prepareForPresentation()
        presenter.present(sheet: self, in: vc, from: view)
    }
    
    open func prepareForPresentation() {
        items.forEach { $0.applyAppearance(appearance) }
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
        applyRoundCorners(to: itemTableView)
        applyRoundCorners(to: headerView)
    }
    
    func applyRoundCorners(to view: UIView?) {
        view?.clipsToBounds = true
        view?.layer.cornerRadius = appearance.cornerRadius
    }
    
    func positionViews() {
        let width = view.frame.width
        positionItemTableView(width: width)
        positionViewsRelativeToHeaderView()
    }
    
    func positionItemTableView(width: CGFloat) {
        itemTableView.frame.origin.x = 0
        itemTableView.frame.origin.y = 0
        itemTableView.frame.size.width = width
        itemTableView.frame.size.height = contentHeight
    }
    
    func positionViewsRelativeToHeaderView() {
        guard let headerView = headerView else { return }
        let headerHeight = headerView.frame.height
        let headerMargin = appearance.headerView.bottomMargin
        headerView.frame.origin = .zero
        headerView.frame.size.width = view.frame.width
        let tableStartY = headerHeight + headerMargin
        itemTableView.frame.origin.y = tableStartY
        itemTableView.frame.size.height -= tableStartY
    }
}
