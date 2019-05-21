//
//  TimeManiaStatisticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import Fluent

struct TimeManiaStatisticsController: RouteCollection {
    
    func boot(router: Router) throws {
        let time = router.grouped("api", "estatisticas", "timemania")
        time.get(use: getAllHandler)
        time.post(TimeManiaStatistics.self, use: createOneHandler)
        time.delete(TimeManiaStatistics.parameter, use: deleteHandler)
    }
    
    func createOneHandler(_ req: Request, stats: TimeManiaStatistics) throws -> Future<TimeManiaStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<TimeManiaStatistics> {
        return try req.parameters.next(TimeManiaStatistics.self)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[TimeManiaStatistics]> {
        return TimeManiaStatistics.query(on: req).all()
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(TimeManiaStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
}

