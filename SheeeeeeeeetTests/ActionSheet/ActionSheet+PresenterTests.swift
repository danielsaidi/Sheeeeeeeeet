import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheet_PresenterTests: QuickSpec {
    
    override func spec() {
        
        describe("default presenter") {
            
            it("is standard presenter for iPhone") {
                let presenter = ActionSheet.defaultPresenter(for: .phone)
                expect(presenter is ActionSheetDefaultPresenter).to(beTrue())
            }
            
            it("is popover presenter for iPad") {
                let presenter = ActionSheet.defaultPresenter(for: .pad)
                expect(presenter is ActionSheetPopoverPresenter).to(beTrue())
            }
        }
    }
}
