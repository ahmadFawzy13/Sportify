import Foundation


protocol TeamDetailsPresenterProtocol{
    
    func attachView(view : TeamDetailsDelegate)
    
    func getFootballLatestEventsByTeam(teamId : Int)
    
    func getFootballUpcomingEventsByTeam(teamId : Int)
        
    func getBasketballLatestEventsByTeam(teamId : Int)
    
    func getBasketballUpcomingEventsByTeam(teamId : Int)
    
}
