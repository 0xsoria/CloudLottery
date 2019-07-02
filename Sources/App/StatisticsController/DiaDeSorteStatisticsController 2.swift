//
//  DiaDeSorteStatisticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import Fluent

struct DiaDeSorteStatisticsController: RouteCollection {
    
    func boot(router: Router) throws {
        let dia = router.grouped("api", "estatisticas", "diadesorte")
        dia.get(use: getAllHandler)
        //dia.post(DiaDeSorteStatistics.self, use: createOneHandler)
        //dia.delete(DiaDeSorteStatistics.parameter, use: deleteHandler)
    }
    
    func createOneHandler(_ req: Request, stats: DiaDeSorteStatistics) throws -> Future<DiaDeSorteStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<DiaDeSorteStatistics> {
        return try req.parameters.next(DiaDeSorteStatistics.self)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[DiaDeSorteStatistics]> {
        return DiaDeSorteStatistics.query(on: req).all()
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(DiaDeSorteStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
}
