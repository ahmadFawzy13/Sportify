import UIKit
import Kingfisher
import SwiftMessages

class FavouritesTableViewController: UITableViewController ,FavouriteLeaguesDelegate{
    
    var favouriteLeaguesPresenter = FavouriteLeaguesPresenter()
    var favouriteLeagues: [LeagueDB] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImageView(image: UIImage(named: "bg.jpeg"))
        background.contentMode = .scaleToFill
        background.frame = tableView.bounds
        tableView.backgroundView = background
        let nib = UINib(nibName: "LeaguesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "nibCell")
        favouriteLeaguesPresenter.attatchView(favouriteLeagueDelegate: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        favouriteLeaguesPresenter.getAllFavouriteLeagues()
    }
    
    func getAllFavouriteLeagues(leagues: [LeagueDB]) {
        favouriteLeagues = leagues
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return favouriteLeagues.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nibCell", for: indexPath)
                as! LeaguesCell
        let processor = RoundCornerImageProcessor(cornerRadius: cell.leagueLogo.frame.height / 2)
        cell.layer.cornerRadius = 30
        cell.backgroundColor = UIColor(named: "leagueCellBg")
        cell.leagueTitle.text = favouriteLeagues[indexPath.section].name
        cell.leagueLogo.kf.setImage(with: URL(string: favouriteLeagues[indexPath.section].logo),placeholder: UIImage(named: "sport.jpg")?.rounded, options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale)
        ])

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LeaguesDetailsCollectionView
        vc.leagueKey = Int(favouriteLeagues[indexPath.section].id)
        vc.leagueLogo = favouriteLeagues[indexPath.section].logo
        vc.leagueName = favouriteLeagues[indexPath.section].name
        if NetworkMonitor.isNetworkAvailable() {
            switch favouriteLeagues[indexPath.section].selectedLeague{
           case "football":
                vc.selectedLeague = .football
            case "basketball":
                vc.selectedLeague = .basketball
            case "tennis":
                vc.selectedLeague = .tennis
            case "cricket" :
                vc.selectedLeague = .cricket
            default:
                break
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            showNegativeAlert(league: favouriteLeagues[indexPath.row] ,indexPath: indexPath)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    func showNegativeAlert(league : LeagueDB , indexPath : IndexPath){
        let view = MessageView.viewFromNib(layout: .centeredView)
        view.configureTheme(.warning)
        view.configureDropShadow()
        view.configureContent(title: "Deletion Warning", body: "Are you sure you want to Delete this league from favourites !", iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Delete", buttonTapHandler: {
            _ in
            self.favouriteLeaguesPresenter.deleteFavouriteLeague(league: league)
            self.favouriteLeagues.remove(at: indexPath.row)
            self.tableView.reloadData()
            SwiftMessages.hide(animated: true)
        })
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    

}
