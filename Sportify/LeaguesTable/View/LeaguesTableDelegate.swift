import Foundation

protocol LeaguesTableDelegate {
    func getAllFootballLeagues( leagues : [League] )
    func getAllBasketballLeagues( leagues : [League] )
    func getAllTennisTournaments( leagues : [League] )
    func getAllCricketLeagues( leagues : [League] )
}
