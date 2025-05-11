import Foundation


protocol RepositoryProtocol {
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
    
    func getAllBasketballLeagues(completionHandler: @escaping ([League]) -> Void)
    
    func getAllTennisTournaments(completionHandler: @escaping ([League]) -> Void)
    
    func getAllCricketLeagues(completionHandler: @escaping ([League]) -> Void)
    
    func insert(league : LeagueDB)
        
    func retrieve () -> [LeagueDB]
    
    func deleteLeague(league : LeagueDB)
    
    func deleteAllLeagues()
    
}
