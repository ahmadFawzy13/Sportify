//
//  Endpoints.swift
//  Sportify
//
//  Created by Abdullah Raed on 13/05/2025.

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
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-05-14&to=2024-07-15&leagueId="//leagueId
    case latestFootballEvents =
        "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-04-10&to=2025-05-10&leagueId=" //Hnzwd id b3d el equal hnb3to fl parameter
    case latestBasketballEvents =
        "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-05-01&to=2025-05-12&leagueId=" //nafs el klam
    case latestCricketEvents =
        "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2025-04-20&to=2025-05-12&leagueId=" //leagueId
    case latestTennisEvents =
        "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&from=2024-06-01&to=2024-06-30&leagueId="//leagueId
    case footballTeams =
        "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&leagueId="
    case basketballTeams =
            "https://apiv2.allsportsapi.com/basketball/?&met=Teams&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&leagueId="
    case cricketTeams =
            "https://apiv2.allsportsapi.com/cricket/?&met=Teams&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11&leagueId="
}
