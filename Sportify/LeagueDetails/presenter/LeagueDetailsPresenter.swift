import Foundation



class LeagueDetailsPresenter : LeagueDetailsPresenterProtocol {
    
    let repo : RepositoryProtocol
    
    init() {
        self.repo = Repository.instance
    }
    
    func getFootballLatestEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        repo.getFootballLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getBasketballLatestEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        repo.getBasketballLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getTennisLatestEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        repo.getTennisLatestEventsById(completionHandle: completionHandle, tournamentId: tournamentId)
    }
    
    func getCricketLatestEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        repo.getCricketLatestEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getFootballUpcomingEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        repo.getFootballUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getBasketballUpcomingEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        repo.getBasketballUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
    func getTennisUpcomingEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        repo.getTennisUpcomingEventsById(completionHandle: completionHandle, tournamentId: tournamentId)
    }
    
    func getCricketUpcomingEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        repo.getCricketUpcomingEventsById(completionHandle: completionHandle, leagueId: leagueId)
    }
    
}
