//
//  DeporteTests.swift
//  DeporteTests
//
//  Created by sandra on 2/7/22.
//  Copyright © 2022 sandra. All rights reserved.
//

import XCTest
@testable import Deporte

class DeporteTests: XCTestCase {
    var allSportsApi = AllSportsAPI()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchingAllSportsFromAPI() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectaion = expectation(description: "waiting for API")
        
        allSportsApi.getAllSportsFromApi { (result) in
            switch result{
            case .success(let sports):
                XCTAssertNotNil(sports)
                expectaion.fulfill()
                
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
