import Foundation


class TeamDetailsPresenter {
    
    let repo : RepositoryProtocol
    var teamDetailsDelegate : TeamDetailsDelegate?
    
    init() {
        self.repo = Repository.instance
    }
    
    
    func attachView(view : TeamDetailsDelegate) {
        self.teamDetailsDelegate = view
    }
    
    func getFootballLatestEventsByTeam(teamId : Int){
        repo.getFootballLatestEventsByTeam(completionHandle: { [weak self] result in
            
            self?.teamDetailsDelegate?.getFootballLatestEventsByTeam(result: result)
            
            
            
        }, teamId: teamId)
    }
    
    func getFootballUpcomingEventsByTeam(teamId : Int){
        repo.getFootballUpcomingEventsByTeam(completionHandle: {[weak self] result in
            
            self?.teamDetailsDelegate?.getFootballUpcomingEventsByTeam(result: result)
            
        }, teamId: teamId)
    }
    
    
    func getBasketballLatestEventsByTeam(teamId : Int){
        repo.getBasketballLatestEventsByTeam(completionHandle: {[weak self] result in
            
            self?.teamDetailsDelegate?.getBasketballLatestEventsByTeam(result: result)
            
        }, teamId: teamId)
    }
    
    
    func getBasketballUpcomingEventsByTeam(teamId : Int){
        repo.getBasketballUpcomingEventsByTeam(completionHandle: {[weak self] result in
            
            self?.teamDetailsDelegate?.getBasketballUpcomingEventsByTeam(result: result)
            
        }, teamId: teamId)
    }
}
