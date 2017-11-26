//
//  ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 BookBeat. All rights reserved.
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


/*public protocol ActionSheetDelegate: class {
    
    func actionSheet(_ sheet: ActionSheet, didSelect item: ActionSheetItem, at indexPath: IndexPath)
}*/


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
        view.backgroundColor = tableView.backgroundColor
    }
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    
    // MARK: - Dependencies
    
    open var presenter: ActionSheetPresenter!
    
    
    // MARK: - Properties
    
    open lazy var appearance: ActionSheetAppearance = {
        let standard = ActionSheetAppearance.standard
        return ActionSheetAppearance(template: standard)
    }()
    
    public var contentHeight: Int {
        var itemHeight = tableViewItems.reduce(0) { $0 + $1.height }
        return itemHeight//////// sectionTotalHeight + itemTotalHeight
    }
    
    open var items = [ActionSheetItem]()
    
    open override var preferredContentSize: CGSize {
        get {
            var size = super.preferredContentSize
            size.height = CGFloat(contentHeight)
            return size
        }
        set { super.preferredContentSize = newValue }
    }
    
    open var preferredPopoverSize: CGSize {
        let width = CGFloat(appearance.popover.width)
        let height = CGFloat(contentHeight)
        return CGSize(width: width, height: height)
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
            print(item.value)
            if item.tapStyle.dismissOnTap {
                self.dismiss()
            }
        }
    }()
    
    
    // MARK: - Presentation Functions
    
    open func dismiss(completion: (() -> ())? = nil) {
        presenter.dismiss(sheet: self, completion: completion)
    }
    
    open func present(in vc: UIViewController, from view: UIView?, completion: (() -> ())? = nil) {
        presenter.present(sheet: self, in: vc, from: view, completion: completion)
    }
    

    // MARK: - Views
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableView.cellLayoutMarginsFollowReadableWidth = false
        view.addSubview(tableView)
        return tableView
    }()
    
    
    // MARK: - Public Functions
    
    public func item(at indexPath: IndexPath) -> ActionSheetItem {
        return tableViewItems[indexPath.row]
    }
    

    
    
    
    /*
 
    public var dismissStyle: ActionSheetDismissStyle = .auto*/
}
