import Foundation


protocol TeamDetailsDelegate{
    
    func getFootballLatestEventsByTeam(result : [FootballEvents])
    
    func getFootballUpcomingEventsByTeam(result : [FootballEvents])
        
    func getBasketballLatestEventsByTeam(result : [BasketBallEvents])

    func getBasketballUpcomingEventsByTeam(result : [BasketBallEvents])
    
}
