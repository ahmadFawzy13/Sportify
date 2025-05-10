import Foundation


//Hnzwd kman interface (Remote) el Remote data source hy3mlo condform w el repo brdo
final class Repository : LocalDataSource{
    
    static let instance = Repository()
    private let localdataSource : LocalDataSource
    
    private init(){
        localdataSource = SportsLocalDataSource.instance
    }
    
    func insert(league : LeagueDB){
        localdataSource.insert(league: league)
    }
    
    func retrieve () -> [LeagueDB] {
        return localdataSource.retrieve()
    }
    
    func deleteLeague(league : LeagueDB) {
        localdataSource.deleteLeague(league: league)
    }
    
    func deleteAllLeagues(){
        localdataSource.deleteAllLeagues()
    }
}
