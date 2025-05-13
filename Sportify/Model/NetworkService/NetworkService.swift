import Foundation
import SwiftyJSON
import Alamofire

enum EndPoint : String{
    case footballLeagues = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case basketballLeagues = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case tennisTournaments = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case cricketLeagues = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case upcomingFootballEvents =
            "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-14&to=2025-06-13&leagueId=" //Hnzwd id b3d el equal hnb3to fl parameter
    case upcomingBasketballEvents =
        "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-14&to=2025-06-13&leagueId=" //nafs el klam
    case upcomingCricketEvents =
        "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-13&to=2025-06-13&leagueId=" //leagueId
    case upcomingTennisEvents =
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-05-14&to=2024-07-15&leagueId="//leagueId
    case latestFootballEvents =
        "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-04-10&to=2025-05-10&leagueId=" //Hnzwd id b3d el equal hnb3to fl parameter
    case latestBasketballEvents =
        "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-01&to=2025-05-12&leagueId=" //nafs el klam
    case latestCricketEvents =
        "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-04-20&to=2025-05-12&leagueId=" //leagueId
    case latestTennisEvents =
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-06-01&to=2024-06-30&leagueId="//leagueId
    
    
}


class NetworkService : NetworkServiceProtocol {
    
    static let instance = NetworkService()
    
    private init() {}
    
    func getAllFootballLeagues(completionHandler: @escaping ([League]) -> Void) {
        var myLeagues: [League] = []
        AF.request(EndPoint.footballLeagues.rawValue)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else { return }
                    do{
                       let json = try JSON(data: data)
                        let leagues = json["result"]
                        for item in leagues.arrayValue{
                            let league = League(item)
                            myLeagues.append(league)
                        }
                        completionHandler(myLeagues)
                    }catch{
                        print(error.localizedDescription)
                        completionHandler([])
                    }
                case let .failure(error):
                    print(error)
                    completionHandler([])
                }
            }
    }
    
    func getAllBasketballLeagues(completionHandler: @escaping ([League]) -> Void) {
        var myLeagues: [League] = []
        AF.request(EndPoint.basketballLeagues.rawValue)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else { return }
                    do{
                       let json = try JSON(data: data)
                        let leagues = json["result"]
                        for item in leagues.arrayValue{
                            let league = League(item)
                            myLeagues.append(league)
                        }
                        completionHandler(myLeagues)
                    }catch{
                        print(error.localizedDescription)
                        completionHandler([])
                    }
                case let .failure(error):
                    print(error)
                    completionHandler([])
                }
            }
    }
    
    func getAllTennisTournaments(completionHandle: @escaping ([League]) -> Void) {
        
        var myLeagues : [League] = []
        
        AF.request(EndPoint.tennisTournaments.rawValue)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let tournaments = json["result"]
                        for item in tournaments.arrayValue{
                            let tournament = League(item)
                            myLeagues.append(tournament)
                        }
                        completionHandle(myLeagues)
                    }catch{
                        completionHandle([])
                        print("Error in tennis api : \(error)")
                    }
                case .failure :
                    print("Error in tennis api")
                    completionHandle([])
                }
                
            }
    }
    
    
    func getAllCricketLeagues(completionHandle: @escaping ([League]) -> Void) {
        
        var myLeagues : [League] = []
        
        AF.request(EndPoint.cricketLeagues.rawValue)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let leagues = json["result"]
                        for item in leagues.arrayValue{
                            let league = League(item)
                            myLeagues.append(league)
                        }
                        completionHandle(myLeagues)
                    }catch{
                        completionHandle([])
                        print("Error in tennis api : \(error)")
                    }
                case .failure :
                    print("Error in tennis api")
                    completionHandle([])
                }
                
            }
    }
    
    func getFootballLatestEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId : Int){
        
        var latestMatches : [FootballEvents] = []
        
        AF.request("\(EndPoint.latestFootballEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = FootballEvents(json: item)
                            latestMatches.append(event)
                        }
                        completionHandle(latestMatches)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
        
    }
    
    func getBasketballLatestEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        
        var latestMatches : [BasketBallEvents] = []
        
        AF.request("\(EndPoint.latestBasketballEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = BasketBallEvents(json: item)
                            latestMatches.append(event)
                        }
                        completionHandle(latestMatches)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
    func getTennisLatestEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        
        var latestMatches : [TennisEvents] = []
        
        AF.request("\(EndPoint.latestTennisEvents.rawValue)\(tournamentId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = TennisEvents(json: item)
                            latestMatches.append(event)
                        }
                        completionHandle(latestMatches)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
    func getCricketLatestEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        var latestMatches : [CricketEvents] = []
        
        AF.request("\(EndPoint.latestCricketEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = CricketEvents(json: item)
                            latestMatches.append(event)
                        }
                        completionHandle(latestMatches)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
    func getFootballUpcomingEventsById(completionHandle: @escaping ([FootballEvents]) -> Void, leagueId: Int) {
        var upcomingMatches : [FootballEvents] = []
        
        AF.request("\(EndPoint.upcomingFootballEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = FootballEvents(json: item)
                            upcomingMatches.append(event)
                        }
                        completionHandle(upcomingMatches)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
    func getBasketballUpcomingEventsById(completionHandle: @escaping ([BasketBallEvents]) -> Void, leagueId: Int) {
        
        var upcomingMatches : [BasketBallEvents] = []
        
        AF.request("\(EndPoint.upcomingBasketballEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200 ..< 300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result{
                    case .success:
                    print("Validation Successful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data: data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue {
                            let event = BasketBallEvents(json: item)
                            upcomingMatches.append(event)
                        }
                        completionHandle(upcomingMatches)
                    }catch{
                        completionHandle([])
                        print("Error in upcoming basketball leagues \(error)")
                    }
                case .failure:
                    print("Error in upcoming basketball leagues")
                    completionHandle([])
                }
            }
    }
    
    func getTennisUpcomingEventsById(completionHandle: @escaping ([TennisEvents]) -> Void, tournamentId: Int) {
        var upcomingEvents : [TennisEvents] = []
        
        AF.request("\(EndPoint.upcomingTennisEvents.rawValue)\(tournamentId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = TennisEvents(json: item)
                            upcomingEvents.append(event)
                        }
                        completionHandle(upcomingEvents)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
    func getCricketUpcomingEventsById(completionHandle: @escaping ([CricketEvents]) -> Void, leagueId: Int) {
        
        var upcomingEvents : [CricketEvents] = []
        
        AF.request("\(EndPoint.latestCricketEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = CricketEvents(json: item)
                            upcomingEvents.append(event)
                        }
                        completionHandle(upcomingEvents)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
    func getFootballTeamsByLeagueId(completionHandle: @escaping ([FootballTeam]) -> Void, leagueId: Int) {
     
        var footballTeams : [FootballTeam] = []
        
        AF.request("\(EndPoint.upcomingFootballEvents.rawValue)\(leagueId)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successsful")
                    guard let data = response.data else {return}
                    do{
                        let json = try JSON(data:data)
                        let latestEvents = json["result"]
                        for item in latestEvents.arrayValue{
                            let event = FootballTeam(json: item)
                            footballTeams.append(event)
                        }
                        completionHandle(footballTeams)
                    }catch{
                        completionHandle([])
                        print("Error in latest events api : \(error)")
                    }
                case .failure :
                    print("Error in latest events api")
                    completionHandle([])
                }
                
            }
    }
    
}
