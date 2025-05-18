import XCTest
@testable import Sportify



final class SportifyTests: XCTestCase {

    var networkService : NetworkServiceProtocol!
    
    override func setUpWithError() throws {
        networkService = NetworkService.instance
    }

    override func tearDownWithError() throws {
        networkService = nil
    }

    func testGetAllFootballLeagues(){
        
        let expectation = expectation(description: "Awaiting response..")
        networkService.getAllFootballLeagues{ leagues in
            
            switch leagues.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(leagues.count > 0)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetAllBasketballLeagues() throws {
        
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getAllBasketballLeagues { leagues in
            
            switch leagues.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(leagues.count > 0)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetFootballLatestEventById(){
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getFootballLatestEventsById(completionHandle: { events in
            
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
            
        }, leagueId: 3)
        waitForExpectations(timeout: 5)
    }
    
    func testGetBasketballLatestEventsById(){
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getBasketballLatestEventsById(completionHandle: { events in
            
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
            
        }, leagueId: 766)
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetTennisLatestEventsById(){
        
        let expectation = expectation(description: "Awaiting response")
        
        networkService.getTennisLatestEventsById(completionHandle: { events in
            
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
            
        }, tournamentId: 2053)
        waitForExpectations(timeout: 5)
    }
    
    func testGetCricketLatestEventsById(){
        let expectation = expectation(description: "Awaiting response")
        
        networkService.getCricketLatestEventsById(completionHandle: { events in
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
        }, leagueId: 745)
        waitForExpectations(timeout: 5)
    }
    
    func testGetFootballUpcomingEventsById(){
        
        let expectation = expectation(description: "Awaiting response")
        
        networkService.getFootballUpcomingEventsById(completionHandle: { events in
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
        }, leagueId: 3)
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetBasketballUpcomingEventsById(){
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getBasketballUpcomingEventsById(completionHandle: { events in
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
        }, leagueId: 766)
        waitForExpectations(timeout: 5)
    }
}
/*
 E3ML TEST L DOOL YA 3BDALLA YA RA2ED YA EBN EL HARAM

func getAllTennisTournaments(completionHandle : @escaping ([League]) -> Void)

func getAllCricketLeagues(completionHandle : @escaping ([League]) -> Void)

func getTennisUpcomingEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int)

func getCricketUpcomingEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int)

func getFootballTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int)

func getBasketballTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int)

func getCricketTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int)

func getFootballUpcomingEventsByTeam(completionHandle: @escaping ([FootballEvents]) -> Void, teamId: Int)
    
func getFootballLatestEventsByTeam(completionHandle: @escaping ([FootballEvents]) -> Void, teamId : Int)
*/
