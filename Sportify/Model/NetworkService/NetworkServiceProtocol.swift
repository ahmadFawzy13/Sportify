import Foundation

protocol NetworkServiceProtocol{
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
    func getAllBasketballLeagues(completionHandler : @escaping ([League]) -> Void)
    func getAllTennisTournaments(completionHandle : @escaping ([League]) -> Void)
    func getAllCricketLeagues(completionHandle : @escaping ([League]) -> Void)
}
