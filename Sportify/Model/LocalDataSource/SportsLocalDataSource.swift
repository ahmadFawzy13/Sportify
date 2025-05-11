import Foundation


final class SportsLocalDataSource : LocalDataSource {
    
    static let instance = SportsLocalDataSource()
    private let coreDataService : CoreDataServices
    
    private init() {
        self.coreDataService = SportsDB.instance
    }
    
    func insert(league : LeagueDB){
        coreDataService.insert(league: league)
    }
    
    func retrieve () -> [LeagueDB] {
        return coreDataService.retrieve()
    }
    
    func deleteLeague(league : LeagueDB) {
        coreDataService.deleteLeague(league: league)
    }
    
    func deleteAllLeagues(){
        coreDataService.deleteAllLeagues()
    }
}
