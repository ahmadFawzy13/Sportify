import Foundation


protocol LeagueDetailsPresenterProtocol{
    
    func getFootballLatestEventsById( leagueId : Int)
    
    func getBasketballLatestEventsById( leagueId: Int)
    
    func getTennisLatestEventsById( tournamentId: Int)
    
    func getCricketLatestEventsById( leagueId: Int)
    
    func getFootballUpcomingEventsById( leagueId : Int)
    
    func getBasketballUpcomingEventsById( leagueId: Int)
    
    func getTennisUpcomingEventsById( tournamentId: Int)
    
    func getCricketUpcomingEventsById( leagueId: Int)
    
    func getFootballTeamsByLeagueId( leagueId: Int)
    
    func getBasketballTeamsByLeagueId( leagueId: Int)
    
    func getCricketTeamsByLeagueId( leagueId: Int)
    
    func insert(league : LeagueDB)
        
}
