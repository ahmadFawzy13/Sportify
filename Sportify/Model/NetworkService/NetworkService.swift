//
//  NetworkService.swift
//  Sportify
//
//  Created by Abdullah Raed on 11/05/2025.
//

import Foundation
import SwiftyJSON
import Alamofire

enum EndPoint : String{
    case footballLeagues = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case basketballLeagues = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case tennisTournaments = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
    case cricketLeagues = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11"
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
    
}
