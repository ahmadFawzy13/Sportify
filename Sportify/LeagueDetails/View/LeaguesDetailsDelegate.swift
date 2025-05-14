//
//  LeaguesDetailsDelegate.swift
//  Sportify
//
//  Created by Abdullah Raed on 14/05/2025.
//


import Foundation

protocol LeaguesDetailsDelegate {
    
    func getFootballLatestEvents( result : [FootballEvents])
    
    func getBasketballLatestEvents( result : [BasketBallEvents])
    
    func getTennisLatestEvents( result : [TennisEvents])
    
    func getCricketLatestEvents( result : [CricketEvents])
    
    func getFootballUpcomingEvents( result : [FootballEvents])
    
    func getBasketballUpcomingEvents( result : [BasketBallEvents])
    
    func getTennisUpcomingEvents( result : [TennisEvents])
    
    func getCricketUpcomingEvents( result : [CricketEvents])
    
    func getFootballTeams( result : [Team])
    
    func getBasketballTeams( result : [Team])
    
    func getCricketTeams( result : [Team])
}
