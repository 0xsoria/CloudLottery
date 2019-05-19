//
//  AnalyticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 05/05/19.
//

import Vapor
import Fluent
import Foundation
import FluentSQL

struct AnalyticsController: RouteCollection {
    
    func boot(router: Router) throws {
        let analyticsRouter = router.grouped("analytics")
        analyticsRouter.get(use: getHandler)
        analyticsRouter.get(use: getAllHandlers)
        analyticsRouter.post(MyAnalytics.self, use: create)
        analyticsRouter.get("search", use: searchHandler)
        analyticsRouter.get("sorted", use: sortedHandlers)
    }
    
    func create(_ req: Request, game: MyAnalytics) throws -> Future<MyAnalytics> {
        return game.save(on: req)
    }
    
    func getAllHandlers(_ req: Request) throws -> Future<[MyAnalytics]> {
        
        return MyAnalytics.query(on: req).all()
    }
    
    func getHandler(_ req: Request) throws -> Future<MyAnalytics> {
        return try req.parameters.next(MyAnalytics.self)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[MyAnalytics]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        return MyAnalytics.query(on: req).filter(\.event == searchTerm).all()
    }
    
    func sortedHandlers(_ req: Request) throws -> Future<[MyAnalytics]> {
        return MyAnalytics.query(on: req).sort(\.date, .ascending).all()
    }
}
