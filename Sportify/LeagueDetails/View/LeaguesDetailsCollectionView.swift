
import UIKit

private let matchCellIdentifier = "matchCell"
private let teamsCellIdentifier = "teamsCell"

class LeaguesDetailsCollectionView: UICollectionViewController , LeaguesDetailsDelegate {
   
    @IBOutlet weak var addToFavouriteButton: UIBarButtonItem!
    
    var leaguesDetailsPresenter : LeagueDetailsPresenter?
    var selectedLeague : Selectedleague?
    
    var footballUpcomingEvents : [FootballEvents] = []
    var basketBallUpcomingEvents : [BasketBallEvents] = []
    var tennisUpcomingEvents : [TennisEvents] = []
    var cricketUpcomingEvents : [CricketEvents] = []
    var cricketLatestEvents : [CricketEvents] = []
    var footballLatestEvents : [FootballEvents] = []
    var basketballLatestEvents : [BasketBallEvents] = []
    var tennisLatestEvents : [TennisEvents] = []
    var team : [Team] = []
    
    var leagueKey : Int?
    var leagueName : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        leaguesDetailsPresenter = LeagueDetailsPresenter()
        leaguesDetailsPresenter?.attachView(view: self)
        
        guard let leagueKey = leagueKey else {
            print("invalid league key")
            return
        }
        
        leaguesDetailsPresenter?.getFootballTeamsByLeagueId(leagueId: leagueKey)
        leaguesDetailsPresenter?.getFootballLatestEventsById(leagueId: leagueKey)
        leaguesDetailsPresenter?.getFootballUpcomingEventsById(leagueId: leagueKey)
        
        leaguesDetailsPresenter?.getBasketballLatestEventsById(leagueId: leagueKey)
        leaguesDetailsPresenter?.getBasketballUpcomingEventsById(leagueId: leagueKey)
        
        leaguesDetailsPresenter?.getTennisLatestEventsById(tournamentId: leagueKey)
        leaguesDetailsPresenter?.getTennisUpcomingEventsById(tournamentId: leagueKey)
        
        leaguesDetailsPresenter?.getCricketLatestEventsById(leagueId: leagueKey)
        leaguesDetailsPresenter?.getCricketUpcomingEventsById(leagueId: leagueKey)
        
        let layout = UICollectionViewCompositionalLayout{
            sectionIndex , environment in
            switch sectionIndex {
            case 0:
                return self.drawFirstSection()
            case 1:
                return self.drawSecondSection()
            case 2: return self.drawThirdSection()
            default:
                return nil
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        self.navigationItem.title = leagueName
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch (section){
        case 0:
            return 10
        case 1:
            return 15
        case 2:
            return 10
        default:
            return 1
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchCellIdentifier, for: indexPath) as! MatchesCell
            cell.matchResult.isHidden = true
            cell.firstTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.secondTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.backgroundLogo.image = UIImage(named: "background.jpg")
            cell.backgroundLogo.alpha = 0.5
            return cell
        case 1:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchCellIdentifier, for: indexPath) as! MatchesCell
            cell.matchResult.isHidden = false
            cell.firstTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.secondTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.backgroundLogo.image = UIImage(named: "background2.jpeg")
            cell.backgroundLogo.alpha = 0.5
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamsCellIdentifier, for: indexPath) as! TeamsCell
            cell.teamLogo.image = cell.teamLogo.image?.rounded
            return cell
        default:
            return UICollectionViewCell()
        }
       
    }
    
    func drawFirstSection()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
        )
    
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/4)),
            subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
    func drawSecondSection()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
        )
    
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)),
            subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
    func drawThirdSection()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(0.7))
        )
    
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 25)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)),
            subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView (ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
       switch indexPath.section {
       case 0:
           headerView.sectionTitle.text = "Up-Coming Events"
       case 1:
           headerView.sectionTitle.text = "Latest Events"
       case 2:
           headerView.sectionTitle.text = "Most Popular Teams"
       default :
           break
       }
       return headerView
    }

    // MARK: UICollectionViewDelegate

    @IBAction func addTofavouriteAction(_ sender: UIBarButtonItem) {
        
    }
    
    func getFootballLatestEvents(result: [FootballEvents]) {
        footballLatestEvents = result
    }
    
    func getBasketballLatestEvents(result: [BasketBallEvents]) {
        basketballLatestEvents = result
    }
    
    func getTennisLatestEvents(result: [TennisEvents]) {
        tennisLatestEvents = result
    }
    
    func getCricketLatestEvents(result: [CricketEvents]) {
        cricketLatestEvents = result
    }
    
    func getFootballUpcomingEvents(result: [FootballEvents]) {
        footballUpcomingEvents = result
    }
    
    func getBasketballUpcomingEvents(result: [BasketBallEvents]) {
        basketBallUpcomingEvents = result
    }
    
    func getTennisUpcomingEvents(result: [TennisEvents]) {
        tennisUpcomingEvents = result
    }
    
    func getCricketUpcomingEvents(result: [CricketEvents]) {
        cricketUpcomingEvents = result
    }
    
    func getFootballTeams(result: [Team]) {
        team = result
    }
    func getBasketballTeams(result: [Team]) {
        team = result
    }
    
    func getCricketTeams(result: [Team]) {
        team = result
    }
    
}
