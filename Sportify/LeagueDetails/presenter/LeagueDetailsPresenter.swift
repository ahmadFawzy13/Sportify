import Foundation



class LeagueDetailsPresenter : LeagueDetailsPresenterProtocol {
    
    private let repo : RepositoryProtocol
    private var leagueDetailsDelegate : LeaguesDetailsDelegate?
    
    init() {
        self.repo = Repository.instance
    }
    
    func attachView(view : LeaguesDetailsDelegate ){
        self.leagueDetailsDelegate = view
    }
    
    func insert(league: LeagueDB) {
        repo.insert(league: league)
    }
    
    func getFootballLatestEventsById(leagueId: Int) {
        repo.getFootballLatestEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getFootballLatestEvents(result: result)
        }, leagueId: leagueId)
    }
    
    func getBasketballLatestEventsById(leagueId: Int) {
        repo.getBasketballLatestEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getBasketballLatestEvents(result: result)
        }, leagueId: leagueId)
    }
    
    func getTennisLatestEventsById(tournamentId: Int) {
        repo.getTennisLatestEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getTennisLatestEvents(result: result)
        }, tournamentId: tournamentId)
    }
    
    func getCricketLatestEventsById(leagueId: Int) {
        repo.getCricketLatestEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getCricketLatestEvents(result: result)
        }, leagueId: leagueId)
    }
    
    func getFootballUpcomingEventsById(leagueId: Int) {
        repo.getFootballUpcomingEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getFootballUpcomingEvents(result: result)
        }, leagueId: leagueId)
    }
    
    func getBasketballUpcomingEventsById(leagueId: Int) {
        repo.getBasketballUpcomingEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getBasketballUpcomingEvents(result: result)
        }, leagueId: leagueId)
    }
    
    func getTennisUpcomingEventsById(tournamentId: Int) {
        repo.getTennisUpcomingEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getTennisUpcomingEvents(result: result)
        }, tournamentId: tournamentId)
    }
    
    func getCricketUpcomingEventsById(leagueId: Int) {
        repo.getCricketUpcomingEventsById(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getCricketUpcomingEvents(result: result)
        }, leagueId: leagueId)
    }
    
    func getFootballTeamsByLeagueId(leagueId: Int) {
        repo.getFootballTeamsByLeagueId(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getFootballTeams(result: result)
        }, leagueId: leagueId)
    }
    
    func getBasketballTeamsByLeagueId( leagueId: Int){
        repo.getBasketballTeamsByLeagueId(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getBasketballTeams(result: result)
        }, leagueId: leagueId)
    }
    
    func getCricketTeamsByLeagueId( leagueId: Int){
        repo.getCricketTeamsByLeagueId(completionHandle: {[weak self]
            result in
            self?.leagueDetailsDelegate?.getCricketTeams(result: result)
        }, leagueId: leagueId)
    }

}
