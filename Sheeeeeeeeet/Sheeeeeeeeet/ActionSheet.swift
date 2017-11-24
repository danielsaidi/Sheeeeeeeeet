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


open class ActionSheet: UIViewController {
    
    
    // MARK: - Setup
    
    open func setup(with title: String?, items: [ActionSheetItem], presenter: ActionSheetPresenter) {
        let section = ActionSheetSection(title: nil, items: items)
        setup(with: title, sections: [section], presenter: presenter)
    }
    
    open func setup(with title: String?, sections: [ActionSheetSection], presenter: ActionSheetPresenter) {
        self.title = title
        self.sections = sections
        self.presenter = presenter
        tableView.reloadData()
    }
    
    
    // MARK: - Properties
    
    public var appearance = ActionSheetAppearance() {
        didSet { setupTableViewHeader() }
    }
    
    public var presenter: ActionSheetPresenter?
    
    open override var title: String? {
        didSet { setupTableViewHeader() }
    }
    
    fileprivate(set) var sections = [ActionSheetSection]()
    
    
    // MARK: - Views
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView.empty
        setupTableViewHeader()
        return tableView
    }()
    
    
    
    
    /*
    
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
     
    // MARK: - Properties
    
    public weak var delegate: ActionSheetDelegate?
    
    public var contentHeight: Int {
        return sectionTotalHeight + itemTotalHeight
    }
    
    public var dismissStyle: ActionSheetDismissStyle = .auto
    
    public var items: [ActionSheetItem] {
        var result = [ActionSheetItem]()
        sections.forEach { result.append(contentsOf: $0.items) }
        return result
    }
    
    
    
    // MARK: - Public Functions
    
    open func dismiss(completion: (() -> ())? = nil) {
        presenter.dismiss(sheet: self, completion: completion)
    }
    
    open func present(in vc: UIViewController, from view: UIView?) {
        presenter.present(sheet: self, in: vc, from: view)
    }
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
  /*
    func item(at indexPath: IndexPath) -> ActionSheetItem {
        let section = sections[indexPath.section]
        let items = section.items
        return items[indexPath.row]
    }
    */
    func setupTableViewHeader() {
        guard let title = title else { return }
        /*let width = view.bounds.width
        let height = appearance.headerAppearance.headerHeight
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let view = ActionSheetHeader(title: title, frame: frame)
        tableView.tableHeaderView = view*/
    }
    
    /*func shouldDisplayFooter(for section: Int) -> Bool {
        let isLastSection = section == sections.count - 1
        return shouldDisplaySections && !isLastSection
    }*/
}

/*

// MARK: - UITableViewDataSource

extension ActionSheet {
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.item(at: indexPath)
        let cell = item.cell(for: tableView)
        item.refresh(cell: cell)
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return shouldDisplaySections ? CGFloat(sectionHeight) : 0
    }
    
    override open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return shouldDisplayFooter(for: section) ? CGFloat(sectionMargin) : 0
    }
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(itemHeight)
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return shouldDisplaySections ? sections[section].title : nil
    }
    
    override open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 3000, height: 1000))
        let line = UIView(frame: CGRect(x: 0, y: 0, width: 3000, height: 0.5))
        line.backgroundColor = tableView.separatorColor
        view.addSubview(line)
        return view
    }
    
    override open func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        guard let label = header.textLabel else { return }
        header.backgroundView = UIImageView(image: UIImage())
        label.font = sectionFont ?? label.font
        label.textColor = sectionTextColor ?? label.textColor
    }
}



// MARK: - UITableViewDelegate

extension ActionSheet {
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.actionSheet(self, didSelect: item(at: indexPath), at: indexPath)
        if dismissStyle == .auto {
            dismiss()
        }
    }
}*/
