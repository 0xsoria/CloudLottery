import Vapor
import Fluent

struct MegaSenaStatisticsController: RouteCollection {
    func boot(router: Router) throws {
        
        let senaStatisticsRouter = router.grouped("api", "estatisticas", "sena")
        senaStatisticsRouter.get(use: getAllHandler)
        senaStatisticsRouter.post(MegaSenaStatistics.self, use: createOneHandler)
        
    }
    
    func createOneHandler(_ req: Request, stats: MegaSenaStatistics) throws -> Future<MegaSenaStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<MegaSenaStatistics> {
        return try req.parameters.next(MegaSenaStatistics.self)
    }
    
//    func updateHandler(_ req: Request) throws -> Future<MegaSenaStatistics> {
//        return try flatMap(to: MegaSenaStatistics.self,
//        req.parameters.next(MegaSenaStatistics.self),
//        req.content.decode(MegaSenaStatistics.self)) { stat, updatedStat in
//
//            stat.one =      updatedStat.one
//            stat.two =      updatedStat.two
//            stat.three =    updatedStat.one
//            stat.four =     updatedStat.one
//            stat.five =     updatedStat.one
//            stat.six =      updatedStat.one
//            stat.seven =    updatedStat.one
//            stat.eight =    updatedStat.one
//            stat.nine =     updatedStat.one
//            stat.tem =      updatedStat.one
//            stat.eleven =   updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//            stat.one =      updatedStat.one
//        }
//    }
    
    func getAllHandler(_ req: Request) throws -> Future<[MegaSenaStatistics]> {
        return MegaSenaStatistics.query(on: req).all()
    }
}
