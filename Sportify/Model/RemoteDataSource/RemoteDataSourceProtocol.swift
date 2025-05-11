import Foundation


protocol RemoteDataSource{
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
    func getAllBasketballLeagues(completionHandler : @escaping ([League]) -> Void)
    func getAllTennisTournaments(completionHandler : @escaping ([League]) -> Void)
    func getAllCricketLeagues(completionHandler : @escaping ([League]) -> Void)
}
