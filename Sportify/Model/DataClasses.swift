import Foundation
import SwiftyJSON


class League {
    
    var leagueName : String
    var leageueKey : Int
    var leagueLogo : String
    var countryKey : Int
    var countryLogo : String
    var countryName : String
    
    init (_ json : JSON){
        self.countryKey = json["country_key"].intValue
        self.countryLogo = json["country_logo"].stringValue
        self.countryName = json["country_name"].stringValue
        self.leageueKey = json["league_key"].intValue
        self.leagueLogo = json["league_logo"].stringValue
        self.leagueName = json["league_name"].stringValue
    }
}

class FootballEvents{
    
    var eventDate : String
    var eventTime : String
    var homeTeamLogo : String
    var awayTeamLogo : String
    var homeTeamName : String
    var awayTeamName : String
    var fulltimeResults : String
    var leagueLogo : String
    
    init(json : JSON) {
        self.eventDate = json["event_date"].stringValue
        self.eventTime = json["event_time"].stringValue
        self.homeTeamLogo = json["home_team_logo"].stringValue
        self.awayTeamLogo = json["away_team_logo"].stringValue
        self.homeTeamName = json["event_home_team"].stringValue
        self.awayTeamName = json["event_away_team"].stringValue
        self.fulltimeResults = json["event_ft_result"].stringValue
        self.leagueLogo = json["league_logo"].stringValue
    }
}

class FootballTeam{
    
    var teamId : Int
    var teamName : String
    var teamLogo : String
    
    init(json : JSON) {
        self.teamId = json["team_key"].intValue
        self.teamName = json["team_name"].stringValue
        self.teamLogo = json["team_logo"].stringValue
    }
    
}

class CricketEvents{
    
    var eventDate : String
    var eventTime : String
    var homeTeamLogo : String
    var awayTeamLogo : String
    var homeTeamName : String
    var awayTeamName : String
    var fulltimeResults : String
    
    init(json : JSON) {
        self.eventDate = json["event_date_start"].stringValue
        self.eventTime = json["event_time"].stringValue
        self.homeTeamLogo = json["event_home_team_logo"].stringValue
        self.awayTeamLogo = json["event_away_team_logo"].stringValue
        self.homeTeamName = json["event_home_team"].stringValue
        self.awayTeamName = json["event_away_team"].stringValue
        self.fulltimeResults = json["event_home_final_result"].stringValue
    }
}

class BasketBallEvents{
    
    var eventDate : String
    var eventTime : String
    var homeTeamLogo : String
    var awayTeamLogo : String
    var homeTeamName : String
    var awayTeamName : String
    var fulltimeResults : String
    
    init(json : JSON) {
        self.eventDate = json["event_date"].stringValue
        self.eventTime = json["event_time"].stringValue
        self.homeTeamLogo = json[ "event_home_team_logo"].stringValue
        self.awayTeamLogo = json["event_away_team_logo"].stringValue
        self.homeTeamName = json["event_home_team"].stringValue
        self.awayTeamName = json["event_away_team"].stringValue
        self.fulltimeResults = json["event_final_result"].stringValue
    }
}

class TennisEvents{
    
    var eventDate : String
    var eventTime : String
    var playerOnePhoto : String
    var playerTwoPhoto : String
    var playerOneName : String
    var playerTwoName : String
    var matchResults : String
    
    init(json : JSON) {
        self.eventDate = json["event_date"].stringValue
        self.eventTime = json["event_time"].stringValue
        self.playerOnePhoto = json["event_first_player_logo"].stringValue
        self.playerTwoPhoto = json[ "event_second_player_logo"].stringValue
        self.playerOneName = json["event_first_player"].stringValue
        self.playerTwoName = json["event_second_player"].stringValue
        self.matchResults = json["event_final_result"].stringValue
    }
}



class LeagueDB {
    var id : String
    var name : String
    var logo : String
    
    init(id: String, name: String, logo: String) {
        self.id = id
        self.name = name
        self.logo = logo
    }
    
}
