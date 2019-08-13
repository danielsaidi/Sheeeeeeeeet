import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheet_PresenterTests: QuickSpec {
    
    override func spec() {
        
        describe("default presenter") {
            
            it("is standard presenter for compact width iPhone") {
                let traits = UITraitCollection(horizontalSizeClass: .compact)
                let result = ActionSheet.defaultPresenter(forIdiom: .phone, traits: traits)
                expect(result is ActionSheetStandardPresenter).to(beTrue())
            }
            
            it("is standard presenter for regular width iPhone") {
                let traits = UITraitCollection(horizontalSizeClass: .compact)
                let result = ActionSheet.defaultPresenter(forIdiom: .phone, traits: traits)
                expect(result is ActionSheetStandardPresenter).to(beTrue())
            }
            
            it("is standard presenter for compact width iPad") {
                let traits = UITraitCollection(horizontalSizeClass: .compact)
                let result = ActionSheet.defaultPresenter(forIdiom: .pad, traits: traits)
                expect(result is ActionSheetStandardPresenter).to(beTrue())
            }
            
            it("is popover presenter for regular width iPad") {
                let traits = UITraitCollection(horizontalSizeClass: .regular)
                let result = ActionSheet.defaultPresenter(forIdiom: .pad, traits: traits)
                expect(result is ActionSheetPopoverPresenter).to(beTrue())
            }
        }
    }
}
