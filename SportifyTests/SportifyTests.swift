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
    
    func testAlltennisTournaments(){
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getAllTennisTournaments(completionHandle: { leagues in
            switch leagues.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(leagues.count > 0)
                expectation.fulfill()
            }
        })
        waitForExpectations(timeout: 5)
    }
    
    func testAllCricketLeagues(){
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getAllCricketLeagues(completionHandle: { leagues in
            switch leagues.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(leagues.count > 0)
                expectation.fulfill()
            }
        })
        waitForExpectations(timeout: 5)
    }
    
    func testTennisUpcomingEventsById(){
        let expectation = expectation(description: "Awaiting response..")
        
        networkService.getTennisUpcomingEventsById(completionHandle: { events in
            switch events.count {
            case 0:
                XCTFail()
            default:
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
        },tournamentId: 2053)
        waitForExpectations(timeout: 5)
    }
    func testCricketUpcomingEventsById(){
        let excpectation = expectation(description: "Awaiting response..")
        
        networkService.getCricketUpcomingEventsById(completionHandle: { events in
            switch events.count {
            case 0 :
                XCTFail()
            default :
                XCTAssert(events.count > 0)
                excpectation.fulfill()
            }
        }, leagueId: 745)
        waitForExpectations(timeout: 5)
    }
    
    func testFootballTeamsByLeagueId(){
        let expectaion = expectation(description: "Awaiting response..")
        networkService.getFootballTeamsByLeagueId(completionHandle: { teams in
            switch teams.count {
                case 0 :
                XCTFail()
            default :
                XCTAssert(teams.count > 0)
                expectaion.fulfill()
            }
        }, leagueId: 3)
        waitForExpectations(timeout: 5)
    }
    
    func testBasketballTeamsByLeagueId(){
        let expectaion = expectation(description: "Awaiting response..")
        networkService.getBasketballTeamsByLeagueId(completionHandle: { teams in
            switch teams.count {
            case 0 :
                XCTFail()
            default :
                XCTAssert(teams.count > 0)
                expectaion.fulfill()
            }
        }, leagueId: 766)
        waitForExpectations(timeout: 5)
    }
    
    func testCricketTeamsByLeagueId(){
        let expectaion = expectation(description: "Awaiting response..")
        networkService.getCricketTeamsByLeagueId(completionHandle: { teams in
            switch teams.count {
            case 0:
                XCTFail()
            default :
                XCTAssert(teams.count > 0)
                expectaion.fulfill()
            }
        }, leagueId: 745)
        waitForExpectations(timeout: 5)
    }
    
    func testFootballUpcomingEventsByTeam(){
        let expectaion = expectation(description: "Awaiting response..")
        networkService.getFootballUpcomingEventsByTeam(completionHandle: { events in
            switch events.count {
            case 0:
                XCTFail()
            default :
                XCTAssert(events.count > 0)
                expectaion.fulfill()
            }
        },teamId: 84)
        waitForExpectations(timeout: 5)
    }
    
    func testFootballLatestEventsByTeam(){
        let expectation = expectation(description: "Awaiting response..")
        networkService.getFootballLatestEventsByTeam(completionHandle: { events in
            switch events.count {
            case 0:
                XCTFail()
            default :
                XCTAssert(events.count > 0)
                expectation.fulfill()
            }
        }, teamId: 84)
        waitForExpectations(timeout: 5)
    }
}

