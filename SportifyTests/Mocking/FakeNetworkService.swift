//
//  FakeNetworkService.swift
//  Sportify
//
//  Created by Abdullah Raed on 19/05/2025.
//

@testable import Sportify

class FakeNetworkService : NetworkServiceProtocol {
    
    var isNetworkAvailable : Bool
    
    init(isNetworkAvailable : Bool){
        self.isNetworkAvailable = isNetworkAvailable
    }
    
    func getAllFootballLeagues(completionHandler: @escaping ([Sportify.League]) -> Void) {
        if isNetworkAvailable{
            let fakeLeagues = [League(),League(),League()]
            completionHandler(fakeLeagues)
        }else{
            completionHandler([])
        }
    }
    
    func getAllBasketballLeagues(completionHandler: @escaping ([Sportify.League]) -> Void) {
        if isNetworkAvailable{
            let fakeLeagues = [League(),League(),League()]
            completionHandler(fakeLeagues)
        }else{
            completionHandler([])
        }
    }
    
    func getAllTennisTournaments(completionHandle: @escaping ([Sportify.League]) -> Void) {
        if isNetworkAvailable{
            
            let fakeLeagues = [League(),League(),League()]
           completionHandle(fakeLeagues)
        }else{
            completionHandle([])
        }
    }
    
    func getAllCricketLeagues(completionHandle: @escaping ([Sportify.League]) -> Void) {
        if isNetworkAvailable{
            let fakeLeagues = [League(),League(),League()]
            completionHandle(fakeLeagues)
        }else{
            completionHandle([])
        }
    }
    
    func getFootballLatestEventsById(completionHandle: @escaping ([Sportify.FootballEvents]) -> Void, leagueId: Int) {
        
    }
    
    func getBasketballLatestEventsById(completionHandle: @escaping ([Sportify.BasketBallEvents]) -> Void, leagueId: Int) {
        
    }
    
    func getTennisLatestEventsById(completionHandle: @escaping ([Sportify.TennisEvents]) -> Void, tournamentId: Int) {
        
    }
    
    func getCricketLatestEventsById(completionHandle: @escaping ([Sportify.CricketEvents]) -> Void, leagueId: Int) {
        
    }
    
    func getFootballUpcomingEventsById(completionHandle: @escaping ([Sportify.FootballEvents]) -> Void, leagueId: Int) {
        
    }
    
    func getBasketballUpcomingEventsById(completionHandle: @escaping ([Sportify.BasketBallEvents]) -> Void, leagueId: Int) {
        
    }
    
    func getTennisUpcomingEventsById(completionHandle: @escaping ([Sportify.TennisEvents]) -> Void, tournamentId: Int) {
        
    }
    
    func getCricketUpcomingEventsById(completionHandle: @escaping ([Sportify.CricketEvents]) -> Void, leagueId: Int) {
        
    }
    
    func getFootballTeamsByLeagueId(completionHandle: @escaping ([Sportify.Team]) -> Void, leagueId: Int) {
        
    }
    
    func getBasketballTeamsByLeagueId(completionHandle: @escaping ([Sportify.Team]) -> Void, leagueId: Int) {
        
    }
    
    func getCricketTeamsByLeagueId(completionHandle: @escaping ([Sportify.Team]) -> Void, leagueId: Int) {
        
    }
    
    func getFootballUpcomingEventsByTeam(completionHandle: @escaping ([Sportify.FootballEvents]) -> Void, teamId: Int) {
        
    }
    
    func getFootballLatestEventsByTeam(completionHandle: @escaping ([Sportify.FootballEvents]) -> Void, teamId: Int) {
        
    }
    
    func getBasketballUpcomingEventsByTeam(completionHandle: @escaping ([Sportify.BasketBallEvents]) -> Void, teamId: Int) {
        
    }
    
    func getBasketballLatestEventsByTeam(completionHandle: @escaping ([Sportify.BasketBallEvents]) -> Void, teamId: Int) {
        
    }
    
}
