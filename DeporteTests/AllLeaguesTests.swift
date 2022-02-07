//
//  AllLeaguesTests.swift
//  DeporteTests
//
//  Created by sandra on 2/7/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import XCTest
@testable import Deporte

class AllLeaguesTests: XCTestCase {
    
    var allLeaguesApi = LeaguesAPI()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllLeaguesFromAPI() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let myExpectation = expectation(description: "Waiting to fetch data from API")
        allLeaguesApi.getLeaguesFromApi(sportName: "Soccer") { (result) in
            switch result{
            case .success(let league):
                XCTAssertNotNil(league)
                myExpectation.fulfill()
                
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
