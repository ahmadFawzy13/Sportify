import Foundation
import UIKit
import CoreData

final class SportsDB : CoreDataServices{
    
    static let instance = SportsDB()
    private let fetchRequest : CoreDataFetchRequest
    private let databaseValidation : CoreDataValidation
    private var context : NSManagedObjectContext
    private var entity : NSEntityDescription?
    
    private init() {
        
        databaseValidation = DatabaseValidation.instance
        fetchRequest = DatabaseFetchRequest.instance
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        entity = NSEntityDescription.entity(forEntityName: "Leagues", in: context)
        
    }
    
    
    func insert(league : LeagueDB){
        
        switch operationValidation(league: league) {
        
        case false:
            
            print("League already inserted")
            
        case true:
            
            guard let dataBaseEntity = entity else {
                print("Problem with database entity while inserting")
                return
            }
            
            let inserOperation = NSManagedObject(entity: dataBaseEntity, insertInto: context)
            
            inserOperation.setValue(league.id, forKey: "id")
            inserOperation.setValue(league.name, forKey: "name")
            inserOperation.setValue(league.logo, forKey: "logo")
            
            do {
                try context.save()
                print("\(league.name) inserted into database")
            } catch {
                print("Error while saving league : \(error.localizedDescription)")
            }
        }
    }
    
    func retrieve () -> [LeagueDB] {
        
        var leaguesList : [LeagueDB] = []
        
        let fetchRequest = databaseFetchRequest()
        
        do{
            
            let savedLeagues = try context.fetch(fetchRequest)
            
            for leagueObj in savedLeagues {
                
                let league = LeagueDB(id: leagueObj.value(forKey: "id") as! String, name: leagueObj.value(forKey: "name") as! String, logo: leagueObj.value(forKey: "logo") as! String)
                
                leaguesList.append(league)
                print("league retrieved : \(league.name)")
            }
            
            print("Total leagues retrieved : \(leaguesList.count)")
            
        }catch{
            print("Error while retrieving from DB - LeaguesDB : \(error)")
        }
        
       return leaguesList
        
    }
    
    
    func deleteLeague(league : LeagueDB) {
      
        let fetchRequest = databaseFetchRequest()
      
        let predicate = NSPredicate(format: "id == %@", league.id)
        
        fetchRequest.predicate = predicate
      
        do{
            let savedLeagues = try context.fetch(fetchRequest)
            
            context.delete(savedLeagues[0])
            
            try context.save()
            
            print("\(league.name) deleted")
            
        }catch {
            print("Error while deleting \(league.name) from database : \(error)")
        }
    }
    
    
    func deleteAllLeagues(){
      
        let fetchRequest = databaseFetchRequest()
        
        do {
            let savedLeagues = try context.fetch(fetchRequest)
            
            for league in savedLeagues{
                context.delete(league)
                try context.save()
            }
          
        }catch{
            print("Error while deleting all leagues : \(error)")
        }
    }
    
    
    func operationValidation (league : LeagueDB) -> Bool {
        
        databaseValidation.databaseContentValidation(league: league)
        
    }
    
    
    func databaseFetchRequest() -> NSFetchRequest<NSManagedObject>{
        
        return fetchRequest.databaseFetchRequest()
        
    }
    
}

fileprivate final class DatabaseValidation : CoreDataValidation {
    
        static let instance = DatabaseValidation()
        
        private init(){}
        
        func databaseContentValidation (league : LeagueDB) -> Bool {
            
            let leagueList = SportsDB.instance.retrieve()
            
            for leagueObj in leagueList {
                if leagueObj.id == league.id{
                    return false
                }
            }
            return true
    }
}

fileprivate final class DatabaseFetchRequest : CoreDataFetchRequest {
    
    static let instance = DatabaseFetchRequest()
    
    private init(){}
    
    func databaseFetchRequest() -> NSFetchRequest<NSManagedObject> {
        
        return NSFetchRequest <NSManagedObject>(entityName: "Leagues")
        
    }
}
