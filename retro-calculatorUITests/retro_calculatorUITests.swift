//
//  retro_calculatorUITests.swift
//  retro-calculatorUITests
//
//  Created by Bruce Burgess on 7/8/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import XCTest

class retro_calculatorUITests: XCTestCase {
        
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
    
    func testCalc() {
        
        let app = XCUIApplication()
        
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        app.buttons["add"].tap()
        fiveButton.tap()
        
        let equalButton = app.buttons["equal"]
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["10.0"].exists)
        
        app.buttons["divide"].tap()
        app.buttons["2"].tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["5.0"].exists)
        
        app.buttons["multiply"].tap()
        fiveButton.tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["25.0"].exists)
        
        app.buttons["subtract"].tap()
        app.buttons["4"].tap()
        equalButton.tap()
        
        XCTAssertTrue(app.staticTexts["21.0"].exists)
        
        
    }
    
}
