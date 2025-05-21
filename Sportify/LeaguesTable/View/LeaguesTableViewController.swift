import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController,LeaguesTableDelegate {
   
    var leaguePresenter = LeaguesPresenter()
    var selectedLeague : Selectedleague?
    var footBallLeagues : [League] = []
    var basketballLeagues : [League] = []
    var tennisLeagues : [League] = []
    var cricketLeagues : [League] = []
    var animate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImageView(image: UIImage(named: "bg.jpeg"))
        background.contentMode = .scaleToFill
        background.frame = tableView.bounds
        tableView.backgroundView = background
        
        let nib = UINib(nibName: "LeaguesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "nibCell")
        
        leaguePresenter.attachView(leaguesTableProtocol: self)
        switch selectedLeague {
        case .football:
            leaguePresenter.getAllFootballLeagues()
        case .basketball:
            leaguePresenter.getAllBasketballLeagues()
        case .cricket:
            leaguePresenter.getAllCricketLeagues()
        case .tennis:
            leaguePresenter.getAllTennisLeagues()
        case .none:
            print("none")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ = NetworkMonitor.isNetworkAvailable()
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
        cricketLeagues = leagues
        tableView.reloadData()
        waitOneSecond()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        switch selectedLeague {
        case .football:
            return footBallLeagues.count
        case .basketball:
            return basketballLeagues.count
        case .cricket:
            return cricketLeagues.count
        case .tennis:
            return tennisLeagues.count
        case .none:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nibCell", for: indexPath) as! LeaguesCell
        
        cell.layer.cornerRadius = 30
        cell.backgroundColor = UIColor(named: "leagueCellBg")
        var chosenLeague : [League] = []
        let processor = RoundCornerImageProcessor(cornerRadius: cell.leagueLogo.frame.height / 2)
        switch selectedLeague {
            
        case .basketball:
            chosenLeague = basketballLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.section].leagueLogo),placeholder: UIImage(named: "nba.jpg")?.rounded, options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .football :
            chosenLeague = footBallLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.section].leagueLogo),placeholder: UIImage(named: "conembol.png")?.rounded , options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .cricket :
            chosenLeague = cricketLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.section].leagueLogo),placeholder: UIImage(named: "cricketPlaceholder.jpg")?.rounded , options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .tennis :
            chosenLeague = tennisLeagues
            cell.leagueLogo.kf.setImage(with: URL(string: chosenLeague[indexPath.section].leagueLogo),placeholder: UIImage(named: "tennisPlaceholder.jpg")?.rounded , options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale)
            ])
        case .none:
            chosenLeague = []
        }
        cell.leagueTitle.text = chosenLeague[indexPath.section].leagueName
        startShimmerEffectForLeagueCell(cell: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LeaguesDetailsCollectionView
        switch selectedLeague {
        case .football:
            vc.leagueKey = footBallLeagues[indexPath.section].leageueKey
            vc.leagueName = footBallLeagues[indexPath.section].leagueName
            vc.leagueLogo = footBallLeagues[indexPath.section].leagueLogo
            vc.selectedLeague = .football
        case .basketball:
            vc.leagueKey = basketballLeagues[indexPath.section].leageueKey
            vc.leagueName = basketballLeagues[indexPath.section].leagueName
            vc.leagueLogo = basketballLeagues[indexPath.section].leagueLogo
            vc.selectedLeague = .basketball
        case .cricket:
            vc.leagueKey = cricketLeagues[indexPath.section].leageueKey
            vc.leagueName = cricketLeagues[indexPath.section].leagueName
            vc.leagueLogo = cricketLeagues[indexPath.section].leagueLogo
            vc.selectedLeague = .cricket
        case .tennis:
            vc.leagueKey = tennisLeagues[indexPath.section].leageueKey
            vc.leagueName = tennisLeagues[indexPath.section].leagueName
            vc.leagueLogo = tennisLeagues[indexPath.section].leagueLogo
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    

}
