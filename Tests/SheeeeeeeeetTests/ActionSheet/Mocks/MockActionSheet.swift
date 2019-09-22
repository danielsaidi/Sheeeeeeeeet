import Sheeeeeeeeet
import UIKit

class MockActionSheet: ActionSheet {
    
    var dismissInvokeCount = 0
    var handleTapInvokeCount = 0
    var handleTapInvokeItems = [MenuItem]()
    var prepareForPresentationInvokeCount = 0
    var refreshInvokeCount = 0
    var refreshButtonsInvokeCount = 0
    var refreshItemsInvokeCount = 0
    var refreshHeaderInvokeCount = 0
    var refreshHeaderVisibilityInvokeCount = 0
    var reloadDataInvokeCount = 0
    var setupInvokeCount = 0
    var setupItemsInvokeCount = 0
    var setupItemsInvokeItems = [[MenuItem]]()
    
    
    private var _presentingViewController: UIViewController?
    override var presentingViewController: UIViewController? {
        get { _presentingViewController }
        set { _presentingViewController = newValue }
    }
    
    
    override func dismiss(completion: @escaping () -> ()) {
        super.dismiss { completion() }
        dismissInvokeCount += 1
    }
    
    override func handleTap(on item: MenuItem) {
        super.handleTap(on: item)
        handleTapInvokeCount += 1
        handleTapInvokeItems.append(item)
    }
    
    override func refresh() {
        super.refresh()
        refreshInvokeCount += 1
    }
    
    override func refreshButtons() {
        super.refreshButtons()
        refreshButtonsInvokeCount += 1
    }
    
    override func refreshItems() {
        super.refreshItems()
        refreshItemsInvokeCount += 1
    }
    
    override func refreshHeader() {
        super.refreshHeader()
        refreshHeaderInvokeCount += 1
    }
    
    override func refreshHeaderVisibility() {
        super.refreshHeaderVisibility()
        refreshHeaderVisibilityInvokeCount += 1
    }
    
    override func reloadData() {
        super.reloadData()
        reloadDataInvokeCount += 1
    }
    
    override func setup() {
        super.setup()
        setupInvokeCount += 1
    }
    
    override func setup(items: [MenuItem]) {
        super.setup(items: items)
        setupItemsInvokeCount += 1
        setupItemsInvokeItems.append(items)
    }
}
