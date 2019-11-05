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
class MockActionSheet: ActionSheet {
    
    var recorder = Mock()
    
    typealias SetupSignature = () -> Void
    typealias SetupWithItemsSignature = ([MenuItem]) -> Void
    
    private var _presentingViewController: UIViewController?
    override var presentingViewController: UIViewController? {
        get { _presentingViewController }
        set { _presentingViewController = newValue }
    }
    
    
    override func dismiss(completion: @escaping () -> ()) {
        super.dismiss { completion() }
        recorder.invoke(dismiss, args: (completion))
    }
    
    override func handleTap(on item: MenuItem) {
        super.handleTap(on: item)
        recorder.invoke(handleTap, args: (item))
    }
    
    override func refresh() {
        super.refresh()
        recorder.invoke(refresh, args: ())
    }
    
    override func refreshButtons() {
        super.refreshButtons()
        recorder.invoke(refreshButtons, args: ())
    }
    
    override func refreshItems() {
        super.refreshItems()
        recorder.invoke(refreshItems, args: ())
    }
    
    override func refreshHeader() {
        super.refreshHeader()
        recorder.invoke(refreshHeader, args: ())
    }
    
    override func refreshHeaderVisibility() {
        super.refreshHeaderVisibility()
        recorder.invoke(refreshHeaderVisibility, args: ())
    }
    
    override func reloadData() {
        super.reloadData()
        recorder.invoke(reloadData, args: ())
    }
    
    override func setup() {
        super.setup()
        recorder.invoke(setup, args: ())
    }
    
    override func setup(items: [MenuItem]) {
        super.setup(items: items)
        recorder.invoke(setup, args: items)
    }
}
