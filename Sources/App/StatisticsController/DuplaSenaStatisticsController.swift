//
//  DuplaSenaStatisticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import Fluent

struct DuplaSenaStatisticsController: RouteCollection {
    
    
    func boot(router: Router) throws {
        let dupla = router.grouped("api", "estatisticas", "duplasena")
        dupla.get(use: getAllHandler)
        dupla.post(DuplaSenaStatistics.self, use: createOneHandler)
        dupla.delete(DuplaSenaStatistics.parameter, use: deleteHandler)
    }
    
    func createOneHandler(_ req: Request, stats: DuplaSenaStatistics) throws -> Future<DuplaSenaStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<DuplaSenaStatistics> {
        return try req.parameters.next(DuplaSenaStatistics.self)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[DuplaSenaStatistics]> {
        return DuplaSenaStatistics.query(on: req).all()
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(DuplaSenaStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
}
