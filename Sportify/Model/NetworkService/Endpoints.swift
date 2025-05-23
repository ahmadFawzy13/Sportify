import Foundation

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
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-05-14&to=2025-07-15&leagueId="//leagueId
    case latestFootballEvents =
        "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-04-10&to=2025-05-10&leagueId=" //Hnzwd id b3d el equal hnb3to fl parameter
    case latestBasketballEvents =
        "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-01&to=2025-05-12&leagueId=" //nafs el klam
    case latestCricketEvents =
        "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-04-20&to=2025-05-12&leagueId=" //leagueId
    case latestTennisEvents =
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-06-01&to=2025-05-15&leagueId="//leagueId
    case footballTeams =
        "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&leagueId="
    case basketballTeams =
            "https://apiv2.allsportsapi.com/basketball/?&met=Teams&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&leagueId="
    case cricketTeams =
            "https://apiv2.allsportsapi.com/cricket/?&met=Teams&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&leagueId="
    
    case upcomingFootballEventsByTeam =
            "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-18&to=2025-06-17&teamId="
    case upcomingBasketballEventsByTeam =
        "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-30&to=2025-12-30&teamId="
    case upcomingTennisEventsByTeam =
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-10-01&to=2025-11-29&playerId="
    case latestFootballEventsByTeam =
        "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-01-01&to=2025-05-17&teamId="
    case latestBasketballEventsByTeam =
        "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-01&to=2025-05-12&teamId="
    case latestTennisEventsByPlayer =
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-06-01&to=2025-05-15&playerId="
    
    
    
}
