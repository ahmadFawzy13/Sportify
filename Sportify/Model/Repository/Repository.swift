import Foundation



final class Repository : RepositoryProtocol {
    
    static let instance = Repository()
    private let localdataSource : LocalDataSource
    private let remoteDataSource : RemoteDataSource
    
    private init(){
        localdataSource = SportsLocalDataSource.instance
        remoteDataSource = SportsRemoteDataSource.instance
    }
    
    func insert(league : LeagueDB){
        localdataSource.insert(league: league)
    }
    
    func retrieve () -> [LeagueDB] {
        return localdataSource.retrieve()
    }
    
    func deleteLeague(league : LeagueDB) {
        localdataSource.deleteLeague(league: league)
    }
    
    func deleteAllLeagues(){
        localdataSource.deleteAllLeagues()
    }
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void){
        remoteDataSource.getAllFootballLeagues(completionHandler: completionHandler)
    }

    func getAllBasketballLeagues(completionHandler: @escaping ([League]) -> Void) {
        remoteDataSource.getAllBasketballLeagues(completionHandler: completionHandler)
    }
    
    func getAllTennisTournaments(completionHandler: @escaping ([League]) -> Void) {
        remoteDataSource.getAllTennisTournaments(completionHandler: completionHandler)
    }
    
    func getAllCricketLeagues(completionHandler: @escaping ([League]) -> Void) {
        remoteDataSource.getAllCricketLeagues(completionHandler: completionHandler)
    }
    
    func getFootballLatestEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        remoteDataSource.getFootballLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getBasketballLatestEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        remoteDataSource.getBasketballLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getTennisLatestEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        remoteDataSource.getTennisLatestEventsById(completionHandle: completionHandle, tournamentId: tournamentId)
    }
    
    func getCricketLatestEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        remoteDataSource.getCricketLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getFootballUpcomingEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        remoteDataSource.getFootballUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getBasketballUpcomingEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        remoteDataSource.getBasketballUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getTennisUpcomingEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        remoteDataSource.getTennisUpcomingEventsById(completionHandle: completionHandle, tournamentId: tournamentId)
    }
    
    func getCricketUpcomingEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        remoteDataSource.getCricketUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
}
