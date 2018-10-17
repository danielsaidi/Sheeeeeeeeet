import Quick
import Nimble
import Sheeeeeeeeet

class ActionSheetPopoverPresenterTests: QuickSpec {
    
    override func spec() {
        
        var sheet: ActionSheet!
        var presenter: ActionSheetPresenter!
        let view = UIView()
        let viewController = UIViewController()
        
//        beforeEach {
//            let items: [ActionSheetItem] = [
//                ActionSheetSingleSelectItem(title: "test", isSelected: true),
//                ActionSheetCancelButton(title: "Cancel"),
//                ActionSheetOkButton(title: "OK")
//            ]
//            
//            sheet = ActionSheet(items: items, action: { (_, _) in })
//            presenter = ActionSheetPopoverPresenter()
//        }
//        
//        beforeEach {
//            expect(sheet.items.count).to(equal(1))
//            expect(sheet.buttons.count).to(equal(2))
//        }
//        
//        
//        describe("setting up sheet for popover presentation") {
//            
//            beforeEach {
//                presenter.present(sheet: sheet, in: viewController, from: view)
//            }
//            
//            it("moves buttons into items group") {
//                expect(sheet.items.count).to(equal(2))
//                expect(sheet.buttons.count).to(equal(0))
//            }
//            
//            it("removes cancel button") {
//                expect(sheet.items.count).to(equal(2))
//                expect(sheet.items.first! is ActionSheetSingleSelectItem).to(beTrue())
//                expect(sheet.items.last! is ActionSheetOkButton).to(beTrue())
//            }
//        }
    }
}
