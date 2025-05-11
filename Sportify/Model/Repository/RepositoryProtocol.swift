//
//  RepositoryProtocol.swift
//  Sportify
//
//  Created by Abdullah Raed on 11/05/2025.
//

import Foundation


protocol RepositoryProtocol {
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
    
    func insert(league : LeagueDB)
        
    func retrieve () -> [LeagueDB]
    
    func deleteLeague(league : LeagueDB)
    
    func deleteAllLeagues()
    
}
