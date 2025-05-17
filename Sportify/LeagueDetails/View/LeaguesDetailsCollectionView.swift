
import UIKit
import SwiftMessages

private let matchCellIdentifier = "matchCell"
private let teamsCellIdentifier = "teamsCell"

class LeaguesDetailsCollectionView: UICollectionViewController , LeaguesDetailsDelegate {
   
    @IBOutlet weak var addToFavouriteButton: UIBarButtonItem!
    
    var leaguesDetailsPresenter : LeagueDetailsPresenter?
    var selectedLeague : Selectedleague?
    
    var footballUpcomingEvents : [FootballEvents] = []
    var footballLatestEvents : [FootballEvents] = []
    
    var basketBallUpcomingEvents : [BasketBallEvents] = []
    var basketballLatestEvents : [BasketBallEvents] = []

    var cricketUpcomingEvents : [CricketEvents] = []
    var cricketLatestEvents : [CricketEvents] = []
    
    var tennisLatestEvents : [TennisEvents] = []
    var tennisUpcomingEvents : [TennisEvents] = []

    var team : [Team] = []
    
    var leagueKey : Int?
    var leagueName : String?
    var leagueDB : LeagueDB?
    
    var animate = true
    
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
        leaguesDetailsPresenter?.getBasketballTeamsByLeagueId(leagueId: leagueKey)
        
        leaguesDetailsPresenter?.getTennisLatestEventsById(tournamentId: leagueKey)
        leaguesDetailsPresenter?.getTennisUpcomingEventsById(tournamentId: leagueKey)
        
        leaguesDetailsPresenter?.getCricketLatestEventsById(leagueId: leagueKey)
        leaguesDetailsPresenter?.getCricketUpcomingEventsById(leagueId: leagueKey)
        leaguesDetailsPresenter?.getCricketTeamsByLeagueId(leagueId: leagueKey)
        
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
        
        var sectionOneCount: Int = 0
        var sectionTwoCount: Int = 0
        
        switch selectedLeague {
        case .football:
            sectionOneCount = footballUpcomingEvents.count
            sectionTwoCount = footballLatestEvents.count
        case .basketball:
            sectionOneCount = basketBallUpcomingEvents.count
            sectionTwoCount = basketballLatestEvents.count
        case .cricket:
            sectionOneCount = cricketUpcomingEvents.count
            sectionTwoCount = cricketLatestEvents.count
        case .tennis:
            sectionOneCount = tennisUpcomingEvents.count
            sectionTwoCount = tennisLatestEvents.count
        case nil:
            break
        }
        
        switch (section){
        case 0:
            return sectionOneCount
        case 1:
            return sectionTwoCount
        case 2:
            return team.count
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
            
                
                
            switch selectedLeague {
            case .football:
                cell.firstTeamLogo.kf.setImage(with: URL(string: footballUpcomingEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: footballUpcomingEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = footballUpcomingEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = footballUpcomingEvents[indexPath.row].awayTeamName
                cell.matchDate.text = footballUpcomingEvents[indexPath.row].eventDate
                cell.matchTime.text = footballUpcomingEvents[indexPath.row].eventTime
                
            case .basketball:
                cell.firstTeamLogo.kf.setImage(with: URL(string: basketBallUpcomingEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: basketBallUpcomingEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = basketBallUpcomingEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = basketBallUpcomingEvents[indexPath.row].awayTeamName
                cell.matchDate.text = basketBallUpcomingEvents[indexPath.row].eventDate
                cell.matchTime.text = basketBallUpcomingEvents[indexPath.row].eventTime
                
            case .cricket:
                cell.firstTeamLogo.kf.setImage(with: URL(string: cricketUpcomingEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: cricketUpcomingEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = cricketUpcomingEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = cricketUpcomingEvents[indexPath.row].awayTeamName
                cell.matchDate.text = cricketUpcomingEvents[indexPath.row].eventDate
                cell.matchTime.text = cricketUpcomingEvents[indexPath.row].eventTime
                
            case .tennis:
                cell.firstTeamLogo.kf.setImage(with: URL(string: tennisUpcomingEvents[indexPath.row].playerOnePhoto))
                cell.secondTeamLogo.kf.setImage(with: URL(string: tennisUpcomingEvents[indexPath.row].playerTwoPhoto))
                cell.firstTeamName.text = tennisUpcomingEvents[indexPath.row].playerOneName
                cell.secondTeamName.text = tennisUpcomingEvents[indexPath.row].playerTwoName
                cell.matchDate.text = tennisUpcomingEvents[indexPath.row].eventDate
                cell.matchTime.text = tennisUpcomingEvents[indexPath.row].eventTime
            case nil:
                break
            }
            startShimmeringEffectForMatchCell(cell: cell)
            return cell
        case 1:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchCellIdentifier, for: indexPath) as! MatchesCell
            cell.matchResult.isHidden = false
            cell.firstTeamLogo.image = cell.firstTeamLogo.image?.rounded
            cell.secondTeamLogo.image = cell.secondTeamLogo.image?.rounded
            
               
            switch selectedLeague {
            case .football:
                cell.firstTeamLogo.kf.setImage(with: URL(string: footballLatestEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: footballLatestEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = footballLatestEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = footballLatestEvents[indexPath.row].awayTeamName
                cell.matchDate.text = footballLatestEvents[indexPath.row].eventDate
                cell.matchTime.text = footballLatestEvents[indexPath.row].eventTime
                cell.matchResult.text = footballLatestEvents[indexPath.row].fulltimeResults
                
            case .basketball:
                cell.firstTeamLogo.kf.setImage(with: URL(string: basketballLatestEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: basketballLatestEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = basketballLatestEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = basketballLatestEvents[indexPath.row].awayTeamName
                cell.matchDate.text = basketballLatestEvents[indexPath.row].eventDate
                cell.matchTime.text = basketballLatestEvents[indexPath.row].eventTime
                cell.matchResult.text = basketballLatestEvents[indexPath.row].fulltimeResults
                
            case .cricket:
                cell.firstTeamLogo.kf.setImage(with: URL(string: cricketLatestEvents[indexPath.row].homeTeamLogo))
                cell.secondTeamLogo.kf.setImage(with: URL(string: cricketLatestEvents[indexPath.row].awayTeamLogo))
                cell.firstTeamName.text = cricketLatestEvents[indexPath.row].homeTeamName
                cell.secondTeamName.text = cricketLatestEvents[indexPath.row].awayTeamName
                cell.matchDate.text = cricketLatestEvents[indexPath.row].eventDate
                cell.matchTime.text = cricketLatestEvents[indexPath.row].eventTime
                cell.matchResult.text = cricketLatestEvents[indexPath.row].fulltimeResults
                
            case .tennis:
                cell.firstTeamLogo.kf.setImage(with: URL(string: tennisLatestEvents[indexPath.row].playerOnePhoto))
                cell.secondTeamLogo.kf.setImage(with: URL(string: tennisLatestEvents[indexPath.row].playerTwoPhoto))
                cell.firstTeamName.text = tennisLatestEvents[indexPath.row].playerOneName
                cell.secondTeamName.text = tennisLatestEvents[indexPath.row].playerTwoName
                cell.matchDate.text = tennisLatestEvents[indexPath.row].eventDate
                cell.matchTime.text = tennisLatestEvents[indexPath.row].eventTime
                cell.matchResult.text = tennisLatestEvents[indexPath.row].matchResults
                
            case nil:
                break
            }
            startShimmeringEffectForMatchCell(cell: cell)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamsCellIdentifier, for: indexPath) as! TeamsCell
            cell.teamLogo.image = cell.teamLogo.image?.rounded
            cell.teamLogo.kf.setImage(with: URL(string: team[indexPath.row].teamLogo))
            
            startShimmeringEffectForTeamsCell(cell: cell)
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
                heightDimension: .fractionalHeight(1/4)),
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
        guard let leagueDB = leagueDB else {return}
        leaguesDetailsPresenter?.insertLeague(league: leagueDB)
        showPositiveAlert()
    }
    
    func getFootballLatestEvents(result: [FootballEvents]) {
            self.footballLatestEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getBasketballLatestEvents(result: [BasketBallEvents]) {
            self.basketballLatestEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getTennisLatestEvents(result: [TennisEvents]) {
            self.tennisLatestEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getCricketLatestEvents(result: [CricketEvents]) {
            self.cricketLatestEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getFootballUpcomingEvents(result: [FootballEvents]) {
            self.footballUpcomingEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getBasketballUpcomingEvents(result: [BasketBallEvents]) {
            self.basketBallUpcomingEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getTennisUpcomingEvents(result: [TennisEvents]) {
            self.tennisUpcomingEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getCricketUpcomingEvents(result: [CricketEvents]) {
            self.cricketUpcomingEvents = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    
    func getFootballTeams(result: [Team]) {
            self.team = result
            self.collectionView.reloadData()
            waitOneSecond()
    }
    func getBasketballTeams(result: [Team]) {
        self.team = result
        self.collectionView.reloadData()
        waitOneSecond()
    }
    
    func getCricketTeams(result: [Team]) {
            self.team = result
            self.collectionView.reloadData()
            waitOneSecond()
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
    
    func startShimmeringEffectForTeamsCell(cell : TeamsCell){
        if animate {
            cell.teamLogo.startShimmeringViewAnimation()
        }
    }
    
    func waitOneSecond() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animate = false
        }
    }
    
    func showPositiveAlert(){
        let view = MessageView.viewFromNib(layout: .centeredView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title : "Insertion Success",body: "Your League has been added successfully !")
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
}
