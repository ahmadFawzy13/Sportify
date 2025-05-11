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
    
    
}
