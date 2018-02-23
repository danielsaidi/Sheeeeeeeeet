import Foundation

public protocol ActionSheetCollectionViewItemContentCell where Self: UICollectionViewCell {
    static var nib: UINib { get }
    static var defaultSize: CGSize { get }
    static var leftInset: CGFloat { get }
    static var rightInset: CGFloat { get }
    static var topInset: CGFloat { get }
    static var bottomInset: CGFloat { get }
    static var itemSpacing: CGFloat { get }
}

open class ActionSheetCollectionViewItem<T>: ActionSheetItem, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout where T: ActionSheetCollectionViewItemContentCell {
    
    
    // MARK: - Initialization
    
    public typealias CellConfigBlock = (T, Int) -> ()
    
    public init(cellType: T.Type, cellConfigBlock: @escaping CellConfigBlock, cellSelectionBlock: @escaping CellConfigBlock, numItems: Int) {
        self.numItems = numItems
        self.cellType = cellType
        self.cellConfigBlock = cellConfigBlock
        self.cellSelectionBlock = cellSelectionBlock
        
        super.init(title: "")
    }
    
    
    // MARK: - Properties
    
    open let numItems: Int
    open let cellType: T.Type
    open let cellConfigBlock: CellConfigBlock
    open let cellSelectionBlock: CellConfigBlock

    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetCollectionViewItemAppearance(copy: appearance.collectionViewItem)
        self.appearance.height = T.defaultSize.height + T.topInset + T.bottomInset + 0.5
    }
    
    open override func cell(for tableView: UITableView) -> UITableViewCell {
        let id = type(of: self).className
        
        tableView.register(ActionSheetCollectionViewItemCell.nib, forCellReuseIdentifier: id)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ActionSheetCollectionViewItemCell else { return UITableViewCell() }
        applyAppearance(to: cell)
        return cell
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let collectionViewCell = cell as? ActionSheetCollectionViewItemCell else { return }
        collectionViewCell.setupWith(cellNib: T.nib)
        collectionViewCell.collectionView.dataSource = self
        collectionViewCell.collectionView.delegate = self
    }
    
    // MARK: - Collection View Delegate+Datasource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numItems
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? T else { return UICollectionViewCell() }
        cellConfigBlock(cell, indexPath.row)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? T else { return }
        cellSelectionBlock(cell, indexPath.row)
    }
    
    
    // MARK: - FlowLayout delegate
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return T.defaultSize
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: T.topInset, left: T.leftInset, bottom: T.bottomInset, right: T.rightInset)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return T.itemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
