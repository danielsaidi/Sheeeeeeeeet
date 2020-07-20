import Sheeeeeeeeet
import Mockery
import UIKit

/**
 This mock action sheet inherits `ActionSheet` and calls its
 super class for all function calls, which means that it can
 be used as a regular action sheet. However, it also records
 all invokations using its `recorder`, which means that each
 call can be inspected afterwards.
 */
class MockActionSheet: ActionSheet, Mockable {

    lazy var dismissRef = MockReference(dismiss)
    lazy var handleTapRef = MockReference(handleTap)
    lazy var refreshRef = MockReference(refresh)
    lazy var refreshButtonsRef = MockReference(refreshButtons)
    lazy var refreshItemsRef = MockReference(refreshItems)
    lazy var refreshHeaderRef = MockReference(refreshHeader)
    lazy var refreshHeaderVisibilityRef = MockReference(refreshHeaderVisibility)
    lazy var reloadDataRef = MockReference(reloadData)
    lazy var setupRef = MockReference(setup as () -> Void)
    lazy var setupItemsRef = MockReference(setup as ([MenuItem]) -> Void)
    
    let mock = Mock()
    
    private var _presentingViewController: UIViewController?
    override var presentingViewController: UIViewController? {
        get { _presentingViewController }
        set { _presentingViewController = newValue }
    }
    
    
    override func dismiss(completion: @escaping () -> ()) {
        super.dismiss { completion() }
        invoke(dismissRef, args: (completion))
    }
    
    override func handleTap(on item: MenuItem) {
        super.handleTap(on: item)
        invoke(handleTapRef, args: (item))
    }
    
    override func refresh() {
        super.refresh()
        invoke(refreshRef, args: ())
    }
    
    override func refreshButtons() {
        super.refreshButtons()
        invoke(refreshButtonsRef, args: ())
    }
    
    override func refreshItems() {
        super.refreshItems()
        invoke(refreshItemsRef, args: ())
    }
    
    override func refreshHeader() {
        super.refreshHeader()
        invoke(refreshHeaderRef, args: ())
    }
    
    override func refreshHeaderVisibility() {
        super.refreshHeaderVisibility()
        invoke(refreshHeaderVisibilityRef, args: ())
    }
    
    override func reloadData() {
        super.reloadData()
        invoke(reloadDataRef, args: ())
    }
    
    override func setup() {
        super.setup()
        invoke(setupRef, args: ())
    }
    
    override func setup(items: [MenuItem]) {
        super.setup(items: items)
        invoke(setupItemsRef, args: items)
    }
}
