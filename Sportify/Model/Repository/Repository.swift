import Foundation


//Hnzwd kman interface (Remote) el Remote data source hy3mlo condform w el repo brdo
final class Repository : RepositoryProtocol {
    
    static let instance = Repository()
    private let localdataSource : LocalDataSource
    private let remoteDataSource : RemoteDataSource
    
    private init(){
        localdataSource = SportsLocalDataSource.instance
        remoteDataSource = SportsRemoteDataSource.instance
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
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void){
        remoteDataSource.getAllFootballLeagues(completionHandler: completionHandler)
    }

    func getAllBasketballLeagues(completionHandler: @escaping ([League]) -> Void) {
        remoteDataSource.getAllBasketballLeagues(completionHandler: completionHandler)
    }
    
    func getAllTennisTournaments(completionHandler: @escaping ([League]) -> Void) {
        remoteDataSource.getAllTennisTournaments(completionHandler: completionHandler)
    }
    
    func getAllCricketLeagues(completionHandler: @escaping ([League]) -> Void) {
        remoteDataSource.getAllCricketLeagues(completionHandler: completionHandler)
    }
}
