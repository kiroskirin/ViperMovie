//
//  MovieServiceUITests.swift
//  MovieServiceUITests
//
//  Created by Kraisorn Soisakhu on 4/14/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import XCTest

class MovieServiceUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShowDetail() {
        
        let app = XCUIApplication()
        
        let table = app.tables.element(boundBy: 0)
        let cell = table.cells.element(boundBy: 0)
        
        cell.tap()
        
        app.navigationBars["Movie List"].buttons["Movie List"].tap()
    }
    
    func testExpandDetail() {
        // List VC
        let listApp = XCUIApplication()
        let listTable = listApp.tables.element(boundBy: 0)
        let cell = listTable.cells.element(boundBy: 0)
        
        cell.tap()
        
        // Detail VC
        let detailApp = XCUIApplication()
        let detailTable = detailApp.tables.element(boundBy: 0)
        let expandCell = detailTable.cells.element(boundBy: 1)
        
        expandCell.tap()
    }
    
}
