import Foundation

class LeaguesPresenter : LeaguesPresenterProtocol {
    
    
    
    var repository : RepositoryProtocol
    private var leaguesTableDelegate : LeaguesTableDelegate?
    
    init() {
        repository = Repository.instance
    }
    
    func attachView(leaguesTableProtocol : LeaguesTableDelegate){
        self.leaguesTableDelegate = leaguesTableProtocol
    }
    
    func getAllFootballLeagues() {
        repository.getAllFootballLeagues{ [weak self]  leagues in
            self?.leaguesTableDelegate?.getAllFootballLeagues(leagues: leagues)
        }
    }
    
    func getAllBasketballLeagues() {
        repository.getAllBasketballLeagues{ [weak self]  leagues in
            self?.leaguesTableDelegate?.getAllBasketballLeagues(leagues: leagues )
        }
    }
    
    func getAllTennisLeagues() {
        repository.getAllTennisTournaments { [weak self] tournaments in
            self?.leaguesTableDelegate?.getAllTennisTournaments(leagues: tournaments)
        }
    }
    
    func getAllCricketLeagues() {
        repository.getAllCricketLeagues { [weak self] tournaments in
            self?.leaguesTableDelegate?.getAllCricketLeagues(leagues: tournaments)
        }
    }
}
