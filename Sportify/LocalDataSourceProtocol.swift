import Foundation


protocol LocalDataSource{
    
    func insert(league : LeagueDB)
    
    func retrieve () -> [LeagueDB]
    
    func deleteLeague(league : LeagueDB)
    
    func deleteAllLeagues()
    
}
