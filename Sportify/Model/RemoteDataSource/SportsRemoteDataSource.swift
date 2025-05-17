import Foundation


class SportsRemoteDataSource : RemoteDataSource {
   
    static let instance = SportsRemoteDataSource()
    private var networkService : NetworkServiceProtocol
    
    private init() {
        self.networkService = NetworkService.instance
    }
    
    func getFootballUpcomingEventsByTeam(completionHandle: @escaping ([FootballEvents]) -> Void, teamId: Int) {
        networkService.getFootballUpcomingEventsByTeam(completionHandle: completionHandle, teamId: teamId)
    }
    
    func getFootballLatestEventsByTeam(completionHandle: @escaping ([FootballEvents]) -> Void, teamId: Int) {
        networkService.getFootballLatestEventsByTeam(completionHandle: completionHandle, teamId: teamId)
    }
    
    func getBasketballUpcomingEventsByTeam(completionHandle: @escaping ([BasketBallEvents]) -> Void, teamId: Int) {
        networkService.getBasketballUpcomingEventsByTeam(completionHandle: completionHandle, teamId: teamId)
    }
    
    func getBasketballLatestEventsByTeam(completionHandle: @escaping ([BasketBallEvents]) -> Void, teamId: Int) {
        networkService.getBasketballLatestEventsByTeam(completionHandle: completionHandle, teamId: teamId)
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
    
    func getFootballTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int) {
        networkService.getFootballTeamsByLeagueId(completionHandle: completionHandle, leagueId: leagueId)
    }
        
    func getBasketballTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int){
        networkService.getBasketballTeamsByLeagueId(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getCricketTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int){
        networkService.getCricketTeamsByLeagueId(completionHandle: completionHandle, leagueId: leagueId)
    }
}
