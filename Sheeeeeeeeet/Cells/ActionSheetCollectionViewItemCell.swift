import Foundation

open class ActionSheetCollectionViewItemCell: ActionSheetItemCell {
    static var nib: UINib = UINib(nibName: "ActionSheetCollectionViewItemCell", bundle: Bundle.init(for: ActionSheetCollectionViewItemCell.self))
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = .horizontal
            collectionView.collectionViewLayout = flow
        }
    }
    
    func setupWith(cellNib: UINib) {
        collectionView.register(cellNib, forCellWithReuseIdentifier: "Cell")
        collectionView.contentInset = .zero
        collectionView.reloadData()
    }
}
