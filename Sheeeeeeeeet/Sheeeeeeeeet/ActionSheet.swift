//
//  ActionSheet.swift
//  BBCore
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 BookBeat. All rights reserved.
//

/*
 
 Action sheets can either display a plain item list or
 items grouped in sections. The plain item list is the
 equivalent of how the native UIActionController works,
 while grouped lists can give you richer action sheets.
 
 Use any of the two setup functions to set which items
 or sections you want to present in your action sheet.
 
 If you create action sheet subclasses, that should be
 in charge or which items/sections they should display
 (e.g. action sheets that sets themselves as their own
 delegate and have more specific delegate protocols to
 which they send more specific events) simply override
 `setup` and add the default items.
 
 Action sheets are by default set to auto-dismiss when
 items are tapped. To modify this behavior, change the
 dismissStyle property.
 
 To change the global appearance for all action sheets
 in your apps, modify the static ActionSheetAppearance
 properties (until I figure out how to create a custom
 appearance proxy). To change the appearance of single
 sheets, modify their non-static appearance properties.
 
 OBS: Do not remove the not required init with nibName
 and bundle. It looks like it is not needed, but it is
 used under the hood.
 
 */

import UIKit


/*public protocol ActionSheetDelegate: class {
    
    func actionSheet(_ sheet: ActionSheet, didSelect item: ActionSheetItem, at indexPath: IndexPath)
}*/


open class ActionSheet: UITableViewController /**UIVC**/ {
    
    
    // MARK: - Initialization
    
    public init(items: [ActionSheetItem], presenter: ActionSheetPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.items = items
        self.presenter = presenter
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.contentInset.bottom = 0
    }
    
    
    // MARK: - Dependencies
    
    open var presenter: ActionSheetPresenter!
    
    
    // MARK: - Properties
    
    open lazy var appearance: ActionSheetAppearance = {
        return ActionSheetAppearance.standard
    }()
    
    public var contentHeight: Int {
        var height = tableViewItems.reduce(0) {
            $0 + $1.height
        }
        return height//////// sectionTotalHeight + itemTotalHeight
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
    
    
    // MARK: - Public Functions
    
    public func item(at indexPath: IndexPath) -> ActionSheetItem {
        return tableViewItems[indexPath.row]
    }
    
    /*
     
    // MARK: - Views
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        setupTableViewHeader()
        return tableView
    }()
    */
    
    
    
    /*
     
    // MARK: - Properties
    
    public weak var delegate: ActionSheetDelegate?
    
    public var dismissStyle: ActionSheetDismissStyle = .auto
}



// MARK: - Calculated Properties

fileprivate extension ActionSheet {
    
    var itemTotalHeight: Int {
        let headerHeight = tableView.tableHeaderView?.bounds.size.height ?? 0
        return items.count * itemHeight + Int(headerHeight)
    }
    
    var sectionTotalHeight: Int {
        guard shouldDisplaySections else { return 0 }
        var result = sectionTopMargin
        result += sections.count * sectionHeight
        result += (sections.count - 1) * sectionMargin
        return result
    }
    
    */
}



// MARK: - Private functions

fileprivate extension ActionSheet {
}
