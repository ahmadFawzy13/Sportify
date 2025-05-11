import Foundation


class SportsRemoteDataSource : RemoteDataSource {
    
    static let instance = SportsRemoteDataSource()
    private var networkService : NetworkServiceProtocol
    
    private init() {
        self.networkService = NetworkService.instance
    }
    
    func getAllFootballLeagues(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllFootballLeagues(completionHandler: completionHandler)
    }
    func getAllBasketballLeagues(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllBasketballLeagues(completionHandler: completionHandler)
    }
    
    func getAllTennisTournaments(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllTennisTournaments(completionHandle: completionHandler)
    }
    
    func getAllCricketLeagues(completionHandler: @escaping ([League]) -> Void) {
        networkService.getAllCricketLeagues(completionHandle: completionHandler)
    }
}
