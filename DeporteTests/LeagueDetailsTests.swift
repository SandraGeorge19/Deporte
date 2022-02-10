//
//  LeagueDetailsTests.swift
//  DeporteTests
//
//  Created by Abdo on 2/10/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import XCTest
@testable import Deporte
class LeagueDetailsTests: XCTestCase {
    var eventsApi = EventsAPIImpl()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testFetchingAllEventsFromAPI() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectaion = expectation(description: "waiting for API")
        
        eventsApi.getEvents(leagueID: "4328") { (result) in
            switch result{
            case .success(let events):
                XCTAssertNotNil(events)
                expectaion.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
