//
//  AddListViewTest.swift
//  MyToDosTests
//
//  Created by Julia Gurbanova on 24.03.2024.
//

import XCTest
@testable import MyToDos

final class AddListViewTest: XCTestCase {
    var sut: AddListView!

    override func setUpWithError() throws {
        sut = AddListView()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testViewLoaded_whenViewIsInstantiatedShouldBeComponents() {
        XCTAssertNotNil(sut.pageTitle)
        XCTAssertNotNil(sut.backButton)
        XCTAssertNotNil(sut.titleTextField)
        XCTAssertNotNil(sut.iconLabel)
        XCTAssertNotNil(sut.iconSelectorView)
        XCTAssertNotNil(sut.addListButton)
    }

    func testButtonAction_whenAddListButtonIsTappedShouldBeCalledAddListAction() {
        let addListButton = sut.addListButton
        XCTAssertNotNil(addListButton, "UIButton does not exist")

        guard let addListButtonAction = addListButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("No actions assigned for .touchUpInside")
            return
        }
        XCTAssertTrue(addListButtonAction.contains("addListAction"))
    }

    func testButtonAction_whenBackButtonIsTappedShouldBeCalledBackAction() {
        let backButton = sut.backButton
        XCTAssertNotNil(backButton, "UIButton does not exist")

        guard let backButtonAction = backButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("No actions assigned for .touchUpInside")
            return
        }
        XCTAssertTrue(backButtonAction.contains("backAction"))
    }

    func testTextField_whenTextFieldIsCreatedShouldBeEmpty() {
        XCTAssertEqual(sut.titleTextField.text, "")
    }

    func testTextField_whenTextFieldHasTextShouldBeCreatedList() {
        sut.titleTextField.text = "Test title"
        sut.addListAction()
        XCTAssertEqual(sut.listModel.title, "Test title")
    }

    func testIcon_whenIconIsSetShouldBeIconInList() {
        sut.selectedIcon("test.icon")
        XCTAssertEqual(sut.listModel.icon, "test.icon")
    }
}
