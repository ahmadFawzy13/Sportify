//
//  NetworkConnectivityTest.swift
//  Sportify
//
//  Created by Abdullah Raed on 19/05/2025.
//

@testable import Sportify
import XCTest

class NetworkConnectivityTest : XCTestCase{
    
    var fakeNetworkService : FakeNetworkService!
    
    override func setUpWithError() throws{
        fakeNetworkService = FakeNetworkService(isNetworkAvailable: true)
    }
    
    override func tearDownWithError() throws{
        fakeNetworkService = nil
    }
    
    func testGetAllFootballLeagues(){
        fakeNetworkService.getAllFootballLeagues { leagues in
            if leagues.count == 0{
                XCTFail("No Internet Connectivity")
            }else{
                XCTAssertTrue(leagues.count > 0, "There is No internet Connectivity")
            }
        }
    }
    
    func testGetAllBasketballLeagues(){
        fakeNetworkService.getAllBasketballLeagues { leagues in
            if leagues.count == 0{
                XCTFail("No Internet Connectivity")
            }else{
                XCTAssertTrue(leagues.count > 0, "There is No internet Connectivity")
            }
        }
    }
    
    func testGetAllTennisLeagues(){
        fakeNetworkService.getAllTennisTournaments { leagues in
            if leagues.count == 0{
                XCTFail("No Internet Connectivity")
            }else{
                XCTAssertTrue(leagues.count > 0, "There is No internet Connectivity")
            }
        }
    }
    
    func testGetAllCricketLeagues(){
        fakeNetworkService.getAllCricketLeagues { leagues in
            if leagues.count == 0{
                XCTFail("No Internet Connectivity")
            }else{
                XCTAssertTrue(leagues.count > 0, "There is No internet Connectivity")
            }
        }
    }
}
