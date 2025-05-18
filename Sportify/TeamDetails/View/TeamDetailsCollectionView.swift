import UIKit
import SwiftMessages
private let playerCell = "player"
private let matchesCell = "teamMatchesCell"

class TeamDetailsCollectionView: UICollectionViewController,TeamDetailsDelegate {
    
    

    var selectedLeague : Selectedleague?
    var team : Team?
    
    let presenter = TeamDetailsPresenter()
    
    var upcomingFootballEvents : [FootballEvents] = []
    var latestFootballEvents : [FootballEvents] = []
    
    var upcomingBasketballEvents : [BasketBallEvents] = []
    var latestBasketballEvents : [BasketBallEvents] = []
    
    var animate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(view: self)
        
        guard let team = team else {return}
        
        switch selectedLeague {
        case .football:
            presenter.getFootballLatestEventsByTeam(teamId: team.teamId)
            presenter.getFootballUpcomingEventsByTeam(teamId: team.teamId)
            
        case .basketball:
            presenter.getBasketballLatestEventsByTeam(teamId: team.teamId)
            presenter.getBasketballUpcomingEventsByTeam(teamId: team.teamId)
        default:
            print("Nothing")
        }
        
        let layout = UICollectionViewCompositionalLayout{sectionIndex,env in
            
            switch sectionIndex {
            case 0,1:
                return self.drawMatchesSection()
            case 2:
                return self.drawPlayersSection()
            default:
                return nil
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        self.navigationItem.title = team.teamName
    }
    
    func drawMatchesSection() -> NSCollectionLayoutSection{
        //Items has size & insets if needed
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //Group has items size & insets if needed
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
        
        let matchGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        matchGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
        ///Section has a group  scrolling & insets if needed
        
        let section = NSCollectionLayoutSection(group: matchGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
    func drawPlayersSection() -> NSCollectionLayoutSection{
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        
        let playerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //Section
        let section = NSCollectionLayoutSection(group: playerGroup)
        section.boundarySupplementaryItems = [createSectionHeader()]
    
        return section
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(80)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    func getFootballLatestEventsByTeam(result: [FootballEvents]) {
        latestFootballEvents = result
        self.collectionView.reloadData()
        waitOneSecond()
    }
    
    func getFootballUpcomingEventsByTeam(result: [FootballEvents]) {
        upcomingFootballEvents = result
        self.collectionView.reloadData()
        waitOneSecond()
    }
    
    func getBasketballLatestEventsByTeam(result: [BasketBallEvents]) {
        latestBasketballEvents = result
        self.collectionView.reloadData()
        waitOneSecond()
    }
    
    func getBasketballUpcomingEventsByTeam(result: [BasketBallEvents]) {
        upcomingBasketballEvents = result
        self.collectionView.reloadData()
        waitOneSecond()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var firstSection = 0
        var secondSection = 0
        var thirdSection = 0
        
        if let team = team {
            thirdSection = team.players.count
        }
        
        switch selectedLeague {
        case .football:
            firstSection = upcomingFootballEvents.count
            secondSection = latestFootballEvents.count
        case .basketball:
            firstSection = upcomingBasketballEvents.count
            secondSection = upcomingBasketballEvents.count
        case .cricket:
            firstSection = 0
            secondSection = 0
        case .tennis:
            firstSection = 0
            secondSection = 0
        case nil:
            break;
        }
        
        switch section {
        case 0:
            return firstSection
        case 1:
            return secondSection
        case 2:
            return thirdSection
        default:
            return 0
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchesCell, for: indexPath) as! MatchesCell
            
            cell.firstTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.secondTeamLogo.image = cell.secondTeamLogo.image?.rounded
            
            switch selectedLeague {
            case .football:
                cell.firstTeamLogo.kf.setImage(with: URL(string: upcomingFootballEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: upcomingFootballEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = upcomingFootballEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = upcomingFootballEvents[indexPath.row].awayTeamName
                cell.matchDate.text = upcomingFootballEvents[indexPath.row].eventDate
                cell.matchTime.text = upcomingFootballEvents[indexPath.row].eventTime
                startShimmeringEffectForMatchCell(cell: cell)
                return cell
            case .basketball:
                cell.firstTeamLogo.kf.setImage(with: URL(string: upcomingBasketballEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: upcomingBasketballEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = upcomingBasketballEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = upcomingBasketballEvents[indexPath.row].awayTeamName
                cell.matchDate.text = upcomingBasketballEvents[indexPath.row].eventDate
                cell.matchTime.text = upcomingBasketballEvents[indexPath.row].eventTime
                startShimmeringEffectForMatchCell(cell: cell)
                return cell
            case .cricket:
                print("Nothing")
                return UICollectionViewCell()
            case .tennis:
                print("Nothing")
                return UICollectionViewCell()
            case nil:
                print("Nothing")
                return UICollectionViewCell()
            }
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchesCell, for: indexPath) as! MatchesCell
            
            cell.firstTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.secondTeamLogo.image = cell.secondTeamLogo.image?.rounded
            
            switch selectedLeague {
            case .football:
                cell.firstTeamLogo.kf.setImage(with: URL(string: latestFootballEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: latestFootballEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = latestFootballEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = latestFootballEvents[indexPath.row].awayTeamName
                cell.matchDate.text = latestFootballEvents[indexPath.row].eventDate
                cell.matchTime.text = latestFootballEvents[indexPath.row].eventTime
                cell.matchResult.text = latestFootballEvents[indexPath.row].fulltimeResults
                startShimmeringEffectForMatchCell(cell: cell)
                return cell
            case .basketball:
                cell.firstTeamLogo.kf.setImage(with: URL(string: latestBasketballEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: latestBasketballEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = latestBasketballEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = latestBasketballEvents[indexPath.row].awayTeamName
                cell.matchDate.text = latestBasketballEvents[indexPath.row].eventDate
                cell.matchTime.text = latestBasketballEvents[indexPath.row].eventTime
                cell.matchResult.text = latestBasketballEvents[indexPath.row].fulltimeResults
                startShimmeringEffectForMatchCell(cell: cell)
                return cell
            case .cricket:
                print("Nothing")
                return UICollectionViewCell()
            case .tennis:
                print("Nothing")
                return UICollectionViewCell()
            case nil:
                print("Nothing")
                return UICollectionViewCell()
            }
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: playerCell, for: indexPath) as! PlayersCell
           
            if let team = team {
                cell.playerImg.kf.setImage(with: URL(string: team.players[indexPath.row].playerImg))
                cell.playerName.text = team.players[indexPath.row].playerName
            }
            startShimmeringEffectForTeamsCell(cell: cell)
           return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func startShimmeringEffectForMatchCell(cell : MatchesCell){
        if animate{
            cell.firstTeamLogo.startShimmeringViewAnimation()
            cell.secondTeamLogo.startShimmeringViewAnimation()
            cell.firstTeamName.startShimmeringViewAnimation()
            cell.secondTeamName.startShimmeringViewAnimation()
            cell.matchDate.startShimmeringViewAnimation()
            cell.matchResult.startShimmeringViewAnimation()
        }
    }
    
    func startShimmeringEffectForTeamsCell(cell : PlayersCell){
        if animate {
            cell.playerImg.startShimmeringViewAnimation()
            cell.playerName.startShimmeringViewAnimation()
        }
    }
    
    func waitOneSecond() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animate = false
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView (ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
       switch indexPath.section {
       case 0:
           headerView.sectionTitle.text = "Upcoming Events"
       case 1:
           headerView.sectionTitle.text = "Latest Events"
       case 2:
           headerView.sectionTitle.text = "Players"
       default :
           break
       }
       return headerView
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
