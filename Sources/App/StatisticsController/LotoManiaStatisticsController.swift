//
//  LotoManiaStatisticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import Fluent

struct LotoManiaStatisticsController: RouteCollection {
    
    func boot(router: Router) throws {
        let loto = router.grouped("api", "estatisticas", "lotomania")
        loto.get(use: getAllHandler)
        //loto.post(LotoManiaStatistics.self, use: createOneHandler)
        //loto.delete(LotoManiaStatistics.parameter, use: deleteHandler)
    }
    
    func createOneHandler(_ req: Request, stats: LotoManiaStatistics) throws -> Future<LotoManiaStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<LotoManiaStatistics> {
        return try req.parameters.next(LotoManiaStatistics.self)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[LotoManiaStatistics]> {
        return LotoManiaStatistics.query(on: req).all()
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(LotoManiaStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
}
