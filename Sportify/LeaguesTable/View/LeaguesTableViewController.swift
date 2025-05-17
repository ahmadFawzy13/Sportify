import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController,LeaguesTableDelegate {
   
    var leaguePresenter = LeaguesPresenter()
    var selectedLeague : Selectedleague?
    var footBallLeagues : [League] = []
    var basketballLeagues : [League] = []
    var tennisLeagues : [League] = []
    var cricket : [League] = []
    var leagueDB : LeagueDB?
    var animate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LeaguesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "nibCell")
        
        leaguePresenter.attachView(leaguesTableProtocol: self)
        leaguePresenter.getAllFootballLeagues()
        leaguePresenter.getAllBasketballLeagues()
        leaguePresenter.getAllTennisLeagues()
        leaguePresenter.getAllCricketLeagues()
        
    }
    
    
    func getAllFootballLeagues(leagues: [League]) {
        footBallLeagues = leagues
        tableView.reloadData()
        waitOneSecond()
    }
    
    func getAllBasketballLeagues(leagues : [League]) {
        basketballLeagues = leagues
        tableView.reloadData()
        waitOneSecond()
    }
    
    func getAllTennisTournaments(leagues: [League]) {
        tennisLeagues = leagues
        tableView.reloadData()
        waitOneSecond()
    }
    
    
    func getAllCricketLeagues(leagues: [League]) {
        cricket = leagues
        tableView.reloadData()
        waitOneSecond()
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch selectedLeague {
        case .football:
            return footBallLeagues.count
        case .basketball:
            return basketballLeagues.count
        case .cricket:
            return cricket.count
        case .tennis:
            return tennisLeagues.count
        case .none:
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nibCell", for: indexPath) as! LeaguesCell
        
        startShimmerEffectForLeagueCell(cell: cell)
        
        var chosenLeague : [League] = []
        let processor = RoundCornerImageProcessor(cornerRadius: cell.leagueLogo.frame.height / 2)
        switch selectedLeague {
            
        case .basketball:
            chosenLeague = basketballLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.row].leagueLogo),placeholder: UIImage(named: "nba.jpg")?.rounded, options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .football :
            chosenLeague = footBallLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.row].leagueLogo),placeholder: UIImage(named: "conembol.png")?.rounded , options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .cricket :
            chosenLeague = cricket
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.row].leagueLogo),placeholder: UIImage(named: "cricketPlaceholder.jpg")?.rounded , options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .tennis :
            chosenLeague = tennisLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.row].leagueLogo),placeholder: UIImage(named: "tennisPlaceholder.jpg")?.rounded , options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .none:
            chosenLeague = []
        }
        cell.leagueTitle.text = chosenLeague[indexPath.row].leagueName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LeaguesDetailsCollectionView
        switch selectedLeague {
        case .football:
            leagueDB = LeagueDB(id: footBallLeagues[indexPath.row].leageueKey
                       ,name: footBallLeagues[indexPath.row].leagueName,
                        logo: footBallLeagues[indexPath.row].leagueLogo)
            vc.leagueDB = leagueDB
            vc.leagueKey = footBallLeagues[indexPath.row].leageueKey
            vc.leagueName = footBallLeagues[indexPath.row].leagueName
            vc.selectedLeague = .football
        case .basketball:
            leagueDB = LeagueDB(id: basketballLeagues[indexPath.row].leageueKey
                       ,name: basketballLeagues[indexPath.row].leagueName,
                        logo: basketballLeagues[indexPath.row].leagueLogo)
            vc.leagueDB = leagueDB
            vc.leagueKey = basketballLeagues[indexPath.row].leageueKey
            vc.leagueName = basketballLeagues[indexPath.row].leagueName
            vc.selectedLeague = .basketball
        case .cricket:
            leagueDB = LeagueDB(id: cricket[indexPath.row].leageueKey
                       ,name: cricket[indexPath.row].leagueName,
                        logo: cricket[indexPath.row].leagueLogo)
            vc.leagueDB = leagueDB
            vc.leagueKey = cricket[indexPath.row].leageueKey
            vc.leagueName = cricket[indexPath.row].leagueName
            vc.selectedLeague = .cricket
        case .tennis:
            leagueDB = LeagueDB(id: tennisLeagues[indexPath.row].leageueKey
                       ,name: tennisLeagues[indexPath.row].leagueName,
                        logo: tennisLeagues[indexPath.row].leagueLogo)
            vc.leagueDB = leagueDB
            vc.leagueKey = tennisLeagues[indexPath.row].leageueKey
            vc.leagueName = tennisLeagues[indexPath.row].leagueName
            vc.selectedLeague = .tennis
        case nil:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func startShimmerEffectForLeagueCell(cell : LeaguesCell){
        if animate {
            cell.leagueLogo.startShimmeringViewAnimation()
            cell.leagueTitle.startShimmeringViewAnimation()
        }
    }
    
    func waitOneSecond() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animate = false
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
