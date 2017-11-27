//
//  ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 purpose?
 how does it work?
 subclasses - how to?
 dismissStyle
 
 To change the global appearance for every action sheet that
 is used in your app, use `UIActionSheetAppearance.standard`.
 
 IMPORTANT: Do not remove the not required init with nibName
 and bundle. It looks like it is not needed, but iOS uses it
 under the hood.
 
 */

import UIKit


open class ActionSheet: UIViewController {
    
    
    // MARK: - Initialization
    
    public init(presenter: ActionSheetPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        setup()
    }
    
    public init(items: [ActionSheetItem], presenter: ActionSheetPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.items = items
        self.presenter = presenter
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    
    // MARK: - Setup
    
    open func setup() {
        view.backgroundColor = .clear
    }
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyRoundCorners()
        positionViews()
    }
    
    
    
    
    // MARK: - Dependencies
    
    open var presenter: ActionSheetPresenter!
    
    
    // MARK: - Properties
    
    open lazy var appearance: ActionSheetAppearance = {
        let standard = ActionSheetAppearance.standard
        return ActionSheetAppearance(copy: standard)
    }()
    
    open var contentHeight: CGFloat {
        let itemHeight = tableViewItems.reduce(0) { $0 + $1.appearance.height }
        guard let view = headerView else { return itemHeight }
        let headerHeight = view.frame.height
        return itemHeight + headerHeight + appearance.headerView.bottomMargin
    }
    
    open var headerView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()
            guard let header = headerView else { return }
            view.addSubview(header)
        }
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
    
    open var tableViewItems: [ActionSheetItem] {
        return items
    }
    
    
    // MARK: - Private Properties
    
    fileprivate lazy var tableViewDataSource: ActionSheetDataSource = {
        return ActionSheetDataSource(actionSheet: self)
    }()
    
    fileprivate lazy var tableViewDelegate: ActionSheetDelegate = {
        return ActionSheetDelegate(actionSheet: self) { item in
            self.tableView.reloadData()
            if item.dismissesOnTap {
                self.dismiss()
            }
        }
    }()


    // MARK: - View Properties

    fileprivate(set) public lazy var tableView: UITableView = {
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
    
    open func dismiss(completion: (() -> ())? = nil) {
        presenter.dismiss(sheet: self, completion: completion)
    }
    
    open func present(in vc: UIViewController, from view: UIView?, completion: (() -> ())? = nil) {
        items.forEach { $0.applyAppearance(appearance) }
        presenter.present(sheet: self, in: vc, from: view, completion: completion)
    }
    
    
    // MARK: - Public Functions
    
    public func item(at indexPath: IndexPath) -> ActionSheetItem {
        return tableViewItems[indexPath.row]
    }
}


// MARK: - Private Functions

fileprivate extension ActionSheet {
    
    func applyRoundCorners() {
        tableView.clipsToBounds = true
        headerView?.clipsToBounds = true
        
        tableView.layer.cornerRadius = appearance.cornerRadius
        headerView?.layer.cornerRadius = appearance.cornerRadius
    }
    
    func positionViews() {
        let width = view.frame.width
        
        tableView.frame.origin.x = 0
        tableView.frame.origin.y = 0
        tableView.frame.size.width = width
        
        guard let view = headerView else { return }
        view.frame.origin = .zero
        view.frame.size.width = width
        let tableStartY = view.frame.height + appearance.headerView.bottomMargin
        tableView.frame.origin.y = tableStartY
    }
}
