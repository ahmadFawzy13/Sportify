import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ = NetworkMonitor.isNetworkAvailable()
    }
    
    @IBAction func football(_ sender: Any) {
        print("Football")
        navigate(selectedLeague: .football)
    }
    
    @IBAction func basketball(_ sender: Any) {
        print("Basketball")
        navigate(selectedLeague: .basketball)
    }
 
    
    @IBAction func cricket(_ sender: Any) {
        print("Cricket")
        navigate(selectedLeague: .cricket)
    }
    
    
    @IBAction func tennis(_ sender: Any) {
        print("Tennis")
        navigate(selectedLeague: .tennis)
    }
    
    func navigate(selectedLeague : Selectedleague){
        let vc = storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesTableViewController
        vc.selectedLeague = selectedLeague
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

