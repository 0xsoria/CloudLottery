//
//  AnalyticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 08/09/19.
//

import Vapor
import Fluent
import Foundation
import FluentSQL

struct NewAnalyticsController: RouteCollection {
    
    func boot(router: Router) throws {
         let analyticsRouter = router.grouped("newanalytics")
         analyticsRouter.get(use: getHandler)
         analyticsRouter.get(use: getAllHandlers)
         analyticsRouter.post(NewAnalytics.self, use: create)
     }
    
    func create(_ req: Request, game: NewAnalytics) throws -> Future<NewAnalytics> {
        return game.save(on: req)
    }
    
    func getAllHandlers(_ req: Request) throws -> Future<[NewAnalytics]> {
        
        return NewAnalytics.query(on: req).all()
    }
    
    func getHandler(_ req: Request) throws -> Future<NewAnalytics> {
        return try req.parameters.next(NewAnalytics.self)
    }
    
}
