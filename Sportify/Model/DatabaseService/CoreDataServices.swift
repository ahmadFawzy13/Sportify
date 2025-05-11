import Foundation
import CoreData


protocol CoreDataServices {
    func insert(league : LeagueDB)
    func retrieve() -> [LeagueDB]
    func deleteLeague(league : LeagueDB)
    func deleteAllLeagues()
}

protocol CoreDataValidation {
    func databaseContentValidation (league : LeagueDB) -> Bool
}

protocol CoreDataFetchRequest {
    func databaseFetchRequest() -> NSFetchRequest<NSManagedObject>
}
