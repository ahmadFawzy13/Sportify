import Foundation

protocol NetworkServiceProtocol{
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
    
    func getAllBasketballLeagues(completionHandler : @escaping ([League]) -> Void)
    
    func getAllTennisTournaments(completionHandle : @escaping ([League]) -> Void)
    
    func getAllCricketLeagues(completionHandle : @escaping ([League]) -> Void)
    
    func getFootballLatestEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId : Int)
    
    func getBasketballLatestEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int)
    
    func getTennisLatestEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int)
    
    func getCricketLatestEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int)
    
    func getFootballUpcomingEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId : Int)
    
    func getBasketballUpcomingEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int)
    
    func getTennisUpcomingEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int)
    
    func getCricketUpcomingEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int)
    
    func getFootballTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int)
    
    func getBasketballTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int)
    
    func getCricketTeamsByLeagueId(completionHandle: @escaping ([Team]) -> Void, leagueId: Int)
    
}
