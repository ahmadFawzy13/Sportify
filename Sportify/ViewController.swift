import UIKit
import SwiftyJSON
import Alamofire
class ViewController: UIViewController {

    var parametersDictionary : Dictionary<String,Int> = ["id" : 4396]
    var myLeagues : [League] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func responseAction(_ sender: Any) {
        
        AF.request("https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=a7a55a0e87bf0b5290697393ee212dde30f1bbef597f2fdeca568ed2beebff11")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else { return }
                    do{
                       let json = try JSON(data: data)
                        let leagues = json["result"]
                        for item in leagues.arrayValue{
                            let league = League(item)
                            self.myLeagues.append(league)
                        }
                        for item in self.myLeagues{
                            print(item.leagueName)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                case let .failure(error):
                    print(error)
                }
            }
        
    }
    
    @IBAction func parametrizedResponse(_ sender: Any) {
        
        parametersDictionary["id"] = 4222
        AF.request("https://www.thesportsdb.com/api/v1/json/3/all_leagues.php",parameters: parametersDictionary)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        return
                    }
                    print(response.result)
                case let .failure(error):
                    print(error)
                }
            }
    }
}

