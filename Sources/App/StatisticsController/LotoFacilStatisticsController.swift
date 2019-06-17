//
//  LotoFacilStatistics.swift
//  App
//
//  Created by Gabriel Soria Souza on 02/03/19.
//

import Vapor
import Fluent

struct LotoFacilStatisticsController: RouteCollection {
    
    func boot(router: Router) throws {
        
        let loto = router.grouped("api", "estatisticas", "lotofacil")
        loto.get(use: getAllHandler)
        //loto.post(LotoFacilStatistics.self, use: createOneHandler)
        //loto.delete(LotoFacilStatistics.parameter, use: deleteHandler)
        
    }
    
    func createOneHandler(_ req: Request, stats: LotoFacilStatistics) throws -> Future<LotoFacilStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<LotoFacilStatistics> {
        return try req.parameters.next(LotoFacilStatistics.self)
    }
    
    func updateHandler(_ req: Request) throws -> Future<LotoFacilStatistics> {
        return try flatMap(to: LotoFacilStatistics.self,
                           req.parameters.next(LotoFacilStatistics.self),
                           req.content.decode(LotoFacilStatistics.self)) { stat, updatedStat in
                            
                            stat.one                =      updatedStat.one
                            stat.two                =      updatedStat.two
                            stat.three              =      updatedStat.three
                            stat.four               =      updatedStat.four
                            stat.five               =      updatedStat.five
                            stat.six                =      updatedStat.six
                            stat.seven              =      updatedStat.seven
                            stat.eight              =      updatedStat.eight
                            stat.nine               =      updatedStat.nine
                            stat.tem                =      updatedStat.tem
                            stat.eleven             =      updatedStat.eleven
                            stat.twelve             =      updatedStat.twelve
                            stat.thirteen           =      updatedStat.thirteen
                            stat.fourteen           =      updatedStat.fourteen
                            stat.fifteen            =      updatedStat.fifteen
                            stat.sixteen            =      updatedStat.sixteen
                            stat.seventeen          =      updatedStat.seventeen
                            stat.eighteen           =      updatedStat.eighteen
                            stat.nineeen            =      updatedStat.nineeen
                            stat.twenty             =      updatedStat.twenty
                            stat.twenty_one         =      updatedStat.twenty_one
                            stat.twenty_two         =      updatedStat.twenty_two
                            stat.twenty_three       =      updatedStat.twenty_three
                            stat.twenty_four        =      updatedStat.twenty_four
                            stat.twenty_five        =      updatedStat.twenty_five
                            
                            return stat.save(on: req)
        }
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[LotoFacilStatistics]> {
        return LotoFacilStatistics.query(on: req).all()
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(LotoFacilStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
}
