import Vapor
import Fluent

struct MegaSenaStatisticsController: RouteCollection {
    func boot(router: Router) throws {
        
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[MegaSenaStatistics]> {
        return MegaSenaStatistics.query(on: req).all()
    }
}
