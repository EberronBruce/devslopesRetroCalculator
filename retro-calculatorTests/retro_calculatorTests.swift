//
//  retro_calculatorTests.swift
//  retro-calculatorTests
//
//  Created by Bruce Burgess on 7/5/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import XCTest

class retro_calculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalcService() {
        XCTAssertNotNil(CalcService.instance)
        XCTAssertEqual(CalcService.Operation.Add.rawValue, "+", "Incorrect operator")
        XCTAssertEqual(CalcService.Operation.Divide.rawValue, "/")
        XCTAssertEqual(CalcService.Operation.Empty.rawValue, "Empty")
        XCTAssertEqual(CalcService.Operation.Multiply.rawValue, "*")
        XCTAssertEqual(CalcService.Operation.Substract.rawValue, "-")
        
        XCTAssertNil(CalcService.instance.multiply("da", numStrB: "de"))
        XCTAssertNotNil(CalcService.instance.multiply("4", numStrB: "21"))
        XCTAssertEqual(CalcService.instance.multiply("5", numStrB: "5"), "25.0")
        
        XCTAssertNil(CalcService.instance.divide("an3", numStrB: "dsdsf"))
        XCTAssertNotNil(CalcService.instance.divide("55.0", numStrB: "55.0"))
        XCTAssertEqual(CalcService.instance.divide("10", numStrB: "5"), "2.0")
        
        XCTAssertNil(CalcService.instance.subtract("dsds", numStrB: "3sde"))
        XCTAssertNotNil(CalcService.instance.subtract("15", numStrB: "5"))
        XCTAssertEqual(CalcService.instance.subtract("15", numStrB: "5"), "10.0")
        
        XCTAssertNil(CalcService.instance.add("de13", numStrB: "3f35"))
        XCTAssertNotNil(CalcService.instance.add("65.3", numStrB: "10"))
        XCTAssertEqual(CalcService.instance.add("65.3", numStrB: "10"), "75.3")
    }
    
    func testAudioService() {
        XCTAssertNotNil(AudioService.instance)
        XCTAssertNotNil(AudioService.instance.pathForResource("btn", fileType: "wav"))
        XCTAssertNotNil(AudioService.instance.btnUrl)
        XCTAssertNil(AudioService.instance.createPlayerWithUrl(NSURL(string: "")!))
        XCTAssertNotNil(AudioService.instance.createPlayerWithUrl(AudioService.instance.btnUrl!))
        
        XCTAssertNil(AudioService.instance.soundFXPlayer)
        
        XCTAssertFalse(AudioService.instance.playCurrentSoundFX())
        
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(AudioService.instance.btnUrl!)
        XCTAssertNotNil(AudioService.instance.soundFXPlayer)
        
        XCTAssertTrue(AudioService.instance.playCurrentSoundFX())

    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
