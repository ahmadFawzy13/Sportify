import UIKit

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
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.8))
        
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        
        let playerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        playerGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
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
    }
    
    func getFootballUpcomingEventsByTeam(result: [FootballEvents]) {
        upcomingFootballEvents = result
    }
    
    func getBasketballLatestEventsByTeam(result: [BasketBallEvents]) {
        latestBasketballEvents = result
    }
    
    func getBasketballUpcomingEventsByTeam(result: [BasketBallEvents]) {
        upcomingBasketballEvents = result
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

//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//    
//        
//    
//        return cell
//    }

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
