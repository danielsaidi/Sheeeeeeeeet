import Sheeeeeeeeet

class MockActionSheet: ActionSheet {
    
    var dismissInvokeCount = 0
    var prepareForPresentationInvokeCount = 0
    var refreshInvokeCount = 0
    var reloadDataInvokeCount = 0
    
    override func dismiss(completion: @escaping () -> ()) {
        super.dismiss { completion() }
        dismissInvokeCount += 1
    }
    
    override func prepareForPresentation() {
        super.prepareForPresentation()
        prepareForPresentationInvokeCount += 1
    }
    
    override func refresh() {
        super.refresh()
        refreshInvokeCount += 1
    }
    
    override func reloadData() {
        super.reloadData()
        reloadDataInvokeCount += 1
    }
}
