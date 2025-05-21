import Foundation

class FavouriteLeaguesPresenter : FavouriteLeaguesPresenterProtocol{
    
    private let sportDB : CoreDataServices = SportsDB.instance
    private var favouriteLeagueDelegate : FavouriteLeaguesDelegate?
    
    
    func attatchView(favouriteLeagueDelegate : FavouriteLeaguesDelegate){
        self.favouriteLeagueDelegate = favouriteLeagueDelegate
    }
    
    func getAllFavouriteLeagues()  {
        favouriteLeagueDelegate?.getAllFavouriteLeagues(leagues: sportDB.retrieve())
    }
    
    func deleteFavouriteLeague(league: LeagueDB) {
        sportDB.deleteLeague(league: league)
    }
    
    
}
