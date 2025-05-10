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
