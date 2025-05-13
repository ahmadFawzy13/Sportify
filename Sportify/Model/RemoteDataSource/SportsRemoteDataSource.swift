import Foundation


class SportsRemoteDataSource : RemoteDataSource {
    
    static let instance = SportsRemoteDataSource()
    private var networkService : NetworkServiceProtocol
    
    private init() {
        self.networkService = NetworkService.instance
    }
    
    func getAllFootballLeagues(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllFootballLeagues(completionHandler: completionHandler)
    }
    func getAllBasketballLeagues(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllBasketballLeagues(completionHandler: completionHandler)
    }
    
    func getAllTennisTournaments(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllTennisTournaments(completionHandle: completionHandler)
    }
    
    func getAllCricketLeagues(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllCricketLeagues(completionHandle: completionHandler)
    }
    
    func getFootballLatestEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        networkService.getFootballLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getBasketballLatestEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        networkService.getBasketballLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getTennisLatestEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        networkService.getTennisLatestEventsById(completionHandle: completionHandle, tournamentId: tournamentId)
    }
    
    func getCricketLatestEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        networkService.getCricketLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getFootballUpcomingEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        networkService.getFootballUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getBasketballUpcomingEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        networkService.getBasketballUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getTennisUpcomingEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        networkService.getTennisUpcomingEventsById(completionHandle: completionHandle, tournamentId: tournamentId)
    }
    
    func getCricketUpcomingEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        networkService.getCricketUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getFootballTeamsByLeagueId(completionHandle: @escaping ([FootballTeam]) -> Void, leagueId: Int) {
        networkService.getFootballTeamsByLeagueId(completionHandle: completionHandle, leagueId: leagueId)
    }
}
