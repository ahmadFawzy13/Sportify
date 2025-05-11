//
//  SportRemoteDataSource.swift
//  Sportify
//
//  Created by Abdullah Raed on 11/05/2025.
//

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
    
}
