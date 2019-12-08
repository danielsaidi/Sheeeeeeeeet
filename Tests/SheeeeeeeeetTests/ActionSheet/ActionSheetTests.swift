//
//  ActionSheetTests.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2017-11-28.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import Sheeeeeeeeet
import UIKit

class ActionSheetTests: QuickSpec {
    
    override func spec() {
        
        var sheet: MockActionSheet!
        
        func createSheet(_ items: [MenuItem] = []) -> MockActionSheet {
            MockActionSheet(
                menu: Menu(items: items),
                action: { _, _ in }
            )
        }
        
        
        // MARK: - Initialization
        
        describe("creating instance") {
            
            var counter: Int!
            var menu: Menu!
            let menuItems = [MenuItem(title: "item title"), OkButton(title: "button title")]
            
            beforeEach {
                counter = 0
                menu = Menu(title: "title", items: menuItems)
            }
            
            context("with menu") {
                
                it("applies provided menu") {
                    let presenter = ActionSheetPopoverPresenter()
                    let sheet = ActionSheet(menu: menu, presenter: presenter) { _, _ in counter += 1 }
                    expect(sheet.presenter).toNot(beNil())
                    expect(sheet.configuration).to(equal(.standard))
                    expect(sheet.headerConfiguration).to(equal(.standard))
                    expect(sheet.items.count).to(equal(2))
                    expect(sheet.items[0] is MenuTitle).to(beTrue())
                    expect(sheet.items[0].title).to(equal("title"))
                    expect(sheet.items[1].title).to(equal("item title"))
                    expect(sheet.buttons.count).to(equal(1))
                    expect(sheet.buttons[0] as? OkButton).toNot(beNil())
                    sheet.selectAction(sheet, sheet.items[0])
                    expect(counter).to(equal(1))
                }
                
                it("can apply custom presenter") {
                    let presenter = ActionSheetPopoverPresenter()
                    let sheet = ActionSheet(menu: menu, presenter: presenter) { _, _ in counter += 1 }
                    expect(sheet.presenter).to(be(presenter))
                }
                
                it("can apply custom action sheet configuration") {
                    let menu = Menu(title: "title", items: [])
                    let sheet = ActionSheet(menu: menu, configuration: .standard) { _, _ in }
                    expect(sheet.configuration).to(equal(.standard))
                }
                
                it("can apply custom header configuration") {
                    let menu = Menu(title: "title", items: [])
                    let config = ActionSheet.HeaderConfiguration(isVisibleInLandscape: false, isVisibleInPopover: false)
                    let sheet = ActionSheet(menu: menu, headerConfiguration: config) { _, _ in }
                    expect(sheet.headerConfiguration).to(equal(config))
                }
            }
        }
        
        
        describe("setup") {
            
            beforeEach {
                sheet = createSheet()
            }
            
            it("applies default preferred popover width") {
                sheet.setup()
                
                expect(sheet.preferredContentSize.width).to(equal(300))
            }
            
            it("applies custom preferred popover width") {
                sheet.preferredPopoverWidth = 200
                sheet.setup()
                
                expect(sheet.preferredContentSize.width).to(equal(200))
            }
        }
        
        
        describe("setup items") {
            
            beforeEach {
                sheet = createSheet()
            }
            
            it("applies empty collection") {
                sheet.setup(items: [])
                
                expect(sheet.items.count).to(equal(0))
                expect(sheet.buttons.count).to(equal(0))
            }
            
            it("separates items and buttons") {
                let item1 = MenuItem(title: "foo")
                let item2 = MenuItem(title: "bar")
                let button = OkButton(title: "baz")
                sheet.setup(items: [button, item1, item2])
                
                expect(sheet.items.count).to(equal(2))
                expect(sheet.items[0]).to(be(item1))
                expect(sheet.items[1]).to(be(item2))
                expect(sheet.buttons.count).to(equal(1))
                expect(sheet.buttons[0]).to(be(button))
            }
            
            it("reloads data an extra time when setting up items") {
                let preExecs = sheet.recorder.executions(of: sheet.reloadData)
                expect(preExecs.count).to(equal(1))
                sheet.setup(items: [])
                let postExecs = sheet.recorder.executions(of: sheet.reloadData)
                expect(postExecs.count).to(equal(2))
            }
        }
        
        
        describe("loading view") {
            
            beforeEach {
                sheet = createSheet()
                sheet.viewDidLoad()
            }
            
            it("sets up action sheet") {
                let execs = sheet.recorder.executions(of: sheet.setup as MockActionSheet.SetupSignature)
                expect(execs.count).to(beGreaterThanOrEqualTo(1))
            }
            
            it("sets up items table view") {
                let view = sheet.itemsTableView
                expect(view.delegate).to(be(sheet.itemHandler))
                expect(view.dataSource).to(be(sheet.itemHandler))
                expect(view.alwaysBounceVertical).to(beFalse())
                expect(view.estimatedRowHeight).to(equal(44))
                expect(view.rowHeight).to(equal(UITableView.automaticDimension))
                expect(view.cellLayoutMarginsFollowReadableWidth).to(beFalse())
            }
            
            it("sets up buttons table view") {
                let view = sheet.buttonsTableView
                expect(view.delegate).to(be(sheet.buttonHandler))
                expect(view.dataSource).to(be(sheet.buttonHandler))
                expect(view.alwaysBounceVertical).to(beFalse())
                expect(view.estimatedRowHeight).to(equal(44))
                expect(view.rowHeight).to(equal(UITableView.automaticDimension))
                expect(view.cellLayoutMarginsFollowReadableWidth).to(beFalse())
            }
        }
        
        
        describe("laying out subviews") {
            
            it("refreshes sheet") {
                sheet = createSheet()
                sheet.viewDidLayoutSubviews()
                let execs = sheet.recorder.executions(of: sheet.refresh)
                expect(execs.count).to(equal(1))
            }
        }
        
        
        describe("minimum content insets") {
            
            it("has correct default value") {
                sheet = createSheet()
                let expected = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                
                expect(sheet.minimumContentInsets).to(equal(expected))
            }
        }
        
        
        describe("preferred popover width") {
            
            it("has correct default value") {
                sheet = createSheet()
                let expected: CGFloat = 300
                
                expect(sheet.preferredPopoverWidth).to(equal(expected))
            }
        }
        
        
        describe("section margins") {
            
            it("has correct default value") {
                sheet = createSheet()
                let expected: CGFloat = 15
                
                expect(sheet.sectionMargins).to(equal(expected))
            }
        }
        
        
        describe("items height") {
            
            beforeEach {
                ActionSheetItemCell.appearance().height = 100
                ActionSheetSingleSelectItemCell.appearance().height = 110
                ActionSheetMultiSelectItemCell.appearance().height = 120
                ActionSheetOkButtonCell.appearance().height = 130
            }
            
            it("is sum of all items") {
                let item1 = MenuItem(title: "foo")
                let item2 = SingleSelectItem(title: "bar", isSelected: true)
                let item3 = MultiSelectItem(title: "baz", isSelected: false)
                let button = OkButton(title: "ok")
                sheet = createSheet([item1, item2, item3, button])
                expect(sheet.itemsHeight).to(equal(330))
            }
        }
        
        
        describe("item handler") {
            
            it("has correct item type") {
                sheet = createSheet()
                
                expect(sheet.itemHandler.itemType).to(equal(.items))
            }
            
            it("has correct items") {
                let item1 = MenuItem(title: "foo")
                let item2 = SingleSelectItem(title: "bar", isSelected: true)
                let button = OkButton(title: "ok")
                sheet = createSheet([item1, item2, button])
                
                expect(sheet.itemHandler.items.count).to(equal(2))
                expect(sheet.itemHandler.items[0]).to(be(item1))
                expect(sheet.itemHandler.items[1]).to(be(item2))
            }
        }
        
        
        describe("items height") {
            
            beforeEach {
                ActionSheetItemCell.appearance().height = 100
                ActionSheetOkButtonCell.appearance().height = 110
                ActionSheetDangerButtonCell.appearance().height = 120
                ActionSheetCancelButtonCell.appearance().height = 130
            }
            
            it("is sum of all items") {
                let item = MenuItem(title: "foo")
                let button1 = OkButton(title: "ok")
                let button2 = DestructiveButton(title: "ok")
                let button3 = CancelButton(title: "ok")
                sheet = createSheet([item, button1, button2, button3])
                
                expect(sheet.buttonsHeight).to(equal(360))
            }
        }
        
        
        describe("item handler") {
            
            it("has correct item type") {
                sheet = createSheet()
                
                expect(sheet.buttonHandler.itemType).to(equal(.buttons))
            }
            
            it("has correct items") {
                let item = MenuItem(title: "foo")
                let button1 = OkButton(title: "ok")
                let button2 = OkButton(title: "ok")
                sheet = createSheet([item, button1, button2])
                
                expect(sheet.buttonHandler.items.count).to(equal(2))
                expect(sheet.buttonHandler.items[0]).to(be(button1))
                expect(sheet.buttonHandler.items[1]).to(be(button2))
            }
        }
        
        
        context("presentation") {
            
            var presenter: MockActionSheetPresenter!
            
            beforeEach {
                presenter = MockActionSheetPresenter()
                sheet = createSheet()
                sheet.presenter = presenter
            }
            
            describe("when dismissed") {
                
                it("it calls presenter") {
                    var counter = 0
                    let completion = { counter += 1 }
                    sheet.dismiss(completion: completion)
                    let execs = presenter.executions(of: presenter.dismiss)
                    execs[0].arguments()
                    expect(counter).to(equal(1))
                    expect(execs.count).to(equal(1))
                }
            }
            
            describe("when presented from view") {
                
                it("refreshes itself") {
                    sheet.present(in: UIViewController(), from: UIView())
                    let execs = sheet.recorder.executions(of: sheet.refresh)
                    expect(execs.count).to(equal(1))
                }
                
                it("calls presenter") {
                    var counter = 0
                    let completion = { counter += 1 }
                    let vc = UIViewController()
                    let view = UIView()
                    sheet.present(in: vc, from: view, completion: completion)
                    let execs = presenter.executions(of: presenter.present as MockActionSheetPresenter.PresentFromViewSignature)
                    expect(execs.count).to(equal(1))
                    let exec = execs[0]
                    exec.arguments.3()
                    expect(exec.arguments.0).to(be(sheet))
                    expect(exec.arguments.1).to(be(vc))
                    expect(exec.arguments.2).to(be(view))
                    expect(counter).to(equal(1))
                }

                it("applies standard appearance if non is applied") {
                    ActionSheetAppearance.global = nil
                    sheet.present(in: UIViewController(), from: UIView()) {}
                    expect(ActionSheetAppearance.global).toNot(beNil())
                }
                
                it("does not apply standard appearance if an appearance is already applied") {
                    let appearance = MockActionSheetAppearance()
                    ActionSheetAppearance.global = appearance
                    sheet.present(in: UIViewController(), from: UIView()) {}
                    expect(ActionSheetAppearance.global).to(be(appearance))
                }
            }
            
            describe("when presented from bar button item") {
                
                it("refreshes itself") {
                    sheet.present(in: UIViewController(), from: UIBarButtonItem())
                    let execs = sheet.recorder.executions(of: sheet.refresh)
                    expect(execs.count).to(equal(1))
                }
                
                it("calls presenter") {
                    var counter = 0
                    let completion = { counter += 1 }
                    let vc = UIViewController()
                    let item = UIBarButtonItem()
                    sheet.present(in: vc, from: item, completion: completion)
                    let execs = presenter.executions(of: presenter.present as MockActionSheetPresenter.PresentFromItemSignature)
                    expect(execs.count).to(equal(1))
                    let exec = execs[0]
                    exec.arguments.3()
                    expect(exec.arguments.0).to(be(sheet))
                    expect(exec.arguments.1).to(be(vc))
                    expect(exec.arguments.2).to(be(item))
                    expect(counter).to(equal(1))
                }

                it("applies standard appearance if non is applied") {
                    ActionSheetAppearance.global = nil
                    sheet.present(in: UIViewController(), from: UIBarButtonItem()) {}
                    expect(ActionSheetAppearance.global).toNot(beNil())
                }
                
                it("does not apply standard appearance if an appearance is already applied") {
                    let appearance = MockActionSheetAppearance()
                    ActionSheetAppearance.global = appearance
                    sheet.present(in: UIViewController(), from: UIBarButtonItem()) {}
                    expect(ActionSheetAppearance.global).to(be(appearance))
                }
            }
        }
        
        
        describe("refreshing") {
            
            var presenter: MockActionSheetPresenter!
            
            beforeEach {
                presenter = MockActionSheetPresenter()
                sheet = createSheet()
                sheet.presenter = presenter
                sheet.refresh()
            }
            
            it("refreshes all components") {
                let headerExecs = sheet.recorder.executions(of: sheet.refreshHeader)
                let headerVisibilityExecs = sheet.recorder.executions(of: sheet.refreshHeaderVisibility)
                let itemsExecs = sheet.recorder.executions(of: sheet.refreshItems)
                let buttonsExecs = sheet.recorder.executions(of: sheet.refreshButtons)
                let refreshExecs = presenter.executions(of: presenter.refreshActionSheet)
                
                expect(headerExecs.count).to(equal(1))
                expect(headerVisibilityExecs.count).to(equal(1))
                expect(itemsExecs.count).to(equal(1))
                expect(buttonsExecs.count).to(equal(1))
                expect(sheet.stackView.spacing).to(equal(15))
                expect(refreshExecs.count).to(equal(1))
            }
        }
        
        
        describe("refreshing header") {
            
            var height: NSLayoutConstraint!
            
            beforeEach {
                height = NSLayoutConstraint()
                sheet = createSheet()
                sheet.headerViewContainerHeight = height
            }
            
            it("refreshes correctly if header view is nil") {
                sheet.refreshHeader()
                expect(sheet.headerViewContainer.subviews.count).to(equal(0))
                expect(height.constant).to(equal(0))
            }
            
            it("refreshes correctly if header view is set") {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
                sheet.headerView = view
                sheet.refreshHeader()
                
                let subviews = sheet.headerViewContainer.subviews
                expect(subviews.count).to(equal(1))
                expect(subviews[0]).to(be(view))
                expect(height.constant).to(equal(200))
            }
        }
        
        
        describe("refreshing header visibility") {
            
            beforeEach {
                sheet = createSheet()
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
                sheet.headerView = view
            }
            
            func setLandscapeOrientation() {
                let view = sheet.view!
                view.frame.size.width = 2 * view.frame.size.height
            }
            
            func setPortraitOrientation() {
                let view = sheet.view!
                view.frame.size.height = 2 * view.frame.size.width
            }
            
            func getConfiguration(showInLandscape: Bool) -> ActionSheet.HeaderConfiguration {
                ActionSheet.HeaderConfiguration(isVisibleInLandscape: showInLandscape, isVisibleInPopover: true)
            }
            
            it("hides header container if header view is nil") {
                sheet.headerView = nil
                sheet.refreshHeaderVisibility()
                expect(sheet.headerViewContainer.isHidden).to(beTrue())
            }
            
            it("hides header container in landscape orientation if set to hide header in landscape") {
                setLandscapeOrientation()
                sheet.headerConfiguration = getConfiguration(showInLandscape: false)
                sheet.refreshHeaderVisibility()
                expect(sheet.headerViewContainer.isHidden).to(beTrue())
            }
            
            it("shows header container in landscape orientation if set to show header in landscape") {
                setLandscapeOrientation()
                sheet.headerConfiguration = getConfiguration(showInLandscape: true)
                sheet.refreshHeaderVisibility()
                expect(sheet.headerViewContainer.isHidden).to(beFalse())
            }
            
            it("shows header container in portrait orientation if set to hide header in landscape") {
                setPortraitOrientation()
                sheet.headerConfiguration = getConfiguration(showInLandscape: false)
                sheet.refreshHeaderVisibility()
                expect(sheet.headerViewContainer.isHidden).to(beFalse())
            }
            
            it("shows header container in portrait orientation if set to show header in landscape") {
                setPortraitOrientation()
                sheet.headerConfiguration = getConfiguration(showInLandscape: true)
                sheet.refreshHeaderVisibility()
                expect(sheet.headerViewContainer.isHidden).to(beFalse())
            }
        }
        
        
        describe("refreshing items") {
            
            var height: NSLayoutConstraint!
            
            beforeEach {
                height = NSLayoutConstraint()
                sheet = createSheet()
                sheet.itemsTableViewHeight = height
                ActionSheetItemCell.appearance().height = 12
                ActionSheetOkButtonCell.appearance().height = 13
            }
            
            it("refreshes correctly if no items are set") {
                sheet.refreshItems()
                
                expect(height.constant).to(equal(0))
            }
            
            it("refreshes correctly if items are set") {
                let item1 = MenuItem(title: "foo")
                let item2 = MenuItem(title: "foo")
                let button = OkButton(title: "foo")
                sheet.setup(items: [item1, item2, button])
                sheet.refreshItems()
                expect(height.constant).to(equal(24))
            }
        }
        
        
        describe("refreshing buttons") {
            
            var height: NSLayoutConstraint!
            
            beforeEach {
                height = NSLayoutConstraint()
                sheet = createSheet()
                sheet.buttonsTableViewHeight = height
                ActionSheetItemCell.appearance().height = 12
                ActionSheetOkButtonCell.appearance().height = 13
            }
            
            it("refreshes correctly if no items are set") {
                sheet.refreshButtons()
                expect(height.constant).to(equal(0))
            }
            
            it("refreshes correctly if items are set") {
                let item = MenuItem(title: "foo")
                let button1 = OkButton(title: "foo")
                let button2 = OkButton(title: "foo")
                sheet.setup(items: [item, button1, button2])
                sheet.refreshButtons()
                expect(height.constant).to(equal(26))
            }
        }
        
        
        describe("handling tap on item") {
            
            beforeEach {
                sheet = createSheet()
            }
            
            it("reloads data") {
                let preExecs = sheet.recorder.executions(of: sheet.reloadData)
                expect(preExecs.count).to(equal(1))
                sheet.handleTap(on: MenuItem(title: ""))
                let postExecs = sheet.recorder.executions(of: sheet.reloadData)
                expect(postExecs.count).to(equal(2))
            }
            
            it("calls select action without dismiss if item has none tap action") {
                var count = 0
                sheet = MockActionSheet(menu: .empty) { (_, _) in count += 1 }
                let item = MenuItem(title: "", tapBehavior: .none)
                sheet.handleTap(on: item)
                let execs = sheet.recorder.executions(of: sheet.dismiss)
                expect(count).to(equal(1))
                expect(execs.count).to(equal(0))
            }
            
            it("calls select action after dismiss if item has dismiss tap action") {
                var count = 0
                sheet = MockActionSheet(menu: .empty) { (_, _) in count += 1 }
                let item = MenuItem(title: "", tapBehavior: .dismiss)
                sheet.handleTap(on: item)
                let execs = sheet.recorder.executions(of: sheet.dismiss)
                expect(count).to(equal(1))
                expect(execs.count).to(equal(1))
            }
        }
        
        
        describe("margin at position") {
            
            beforeEach {
                sheet = createSheet()
            }
            
            it("ignores custom edge margins with smaller value than the default ones") {
                let sheet = createSheet()
                sheet.minimumContentInsets = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
                guard #available(iOS 11.0, *) else { return }
                expect(sheet.margin(at: .top)).to(equal(sheet.view.safeAreaInsets.top))
                expect(sheet.margin(at: .left)).to(equal(sheet.view.safeAreaInsets.left))
                expect(sheet.margin(at: .right)).to(equal(sheet.view.safeAreaInsets.right))
                expect(sheet.margin(at: .bottom)).to(equal(sheet.view.safeAreaInsets.bottom))
            }

            it("uses custom edge margins with greated value than the default ones") {
                let sheet = createSheet()
                sheet.minimumContentInsets = UIEdgeInsets(top: 111, left: 222, bottom: 333, right: 444)
                
                expect(sheet.margin(at: .top)).to(equal(111))
                expect(sheet.margin(at: .left)).to(equal(222))
                expect(sheet.margin(at: .bottom)).to(equal(333))
                expect(sheet.margin(at: .right)).to(equal(444))
            }
        }
        
        describe("reloading data") {
            
            it("reloads both table views") {
                let view1 = MockItemTableView(frame: .zero)
                let view2 = MockButtonTableView(frame: .zero)
                sheet = createSheet()
                sheet.itemsTableView = view1
                sheet.buttonsTableView = view2
                sheet.reloadData()
                expect(view1.reloadDataInvokeCount).to(equal(1))
                expect(view2.reloadDataInvokeCount).to(equal(1))
            }
        }
    }
}
