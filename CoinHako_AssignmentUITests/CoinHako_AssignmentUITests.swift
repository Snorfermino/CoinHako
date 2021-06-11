//
//  CoinHako_AssignmentUITests.swift
//  CoinHako_AssignmentUITests
//
//  Created by Tien Dat on 6/6/21.
//

import XCTest

class CoinHako_AssignmentUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchBar() throws {
        let app = XCUIApplication()
        app.launch()

        let searchTextField = app.textFields["searchTextField"]
        let listView = app.tables["cryptoList"]
        let notFilteredCount = listView.cells.count
        searchTextField.tap()
        searchTextField.typeText("B")
        searchTextField.typeText("T")
        searchTextField.typeText("C")
        XCTAssertNotEqual(notFilteredCount, listView.cells.count)
        let clearButton = app.buttons["clearButton"]
        clearButton.tap()
        XCTAssertEqual(searchTextField.label, "")
        XCTAssertEqual(notFilteredCount, listView.cells.count)
    }
    
    func testPriceIsUpdate() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let searchTextField = app.textFields["searchTextField"]
        let listView = app.tables["cryptoList"]
        searchTextField.tap()
        searchTextField.typeText("B")
        searchTextField.typeText("T")
        searchTextField.typeText("C")
        let first = listView.cells.firstMatch.label
        sleep(35)
        XCTAssertFalse(first == listView.cells.firstMatch.label)
    }
}
