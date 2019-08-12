//
//  TimeManiaController.swift
//  App
//
//  Created by Gabriel Soria Souza on 20/05/19.
//

import Vapor
import Fluent
import Foundation
import FluentSQL

struct TimeManiaController: RouteCollection {
    
    func boot(router: Router) throws {
        
        let time = router.grouped("api", "timemania")
        time.get(use: getAllHandler)
        //time.post([TimeMania].self, use: createManyHandlers)
        //time.post(TimeMania.self, use: createOneHandler)
        time.get(TimeMania.parameter, use: getHandler)
        //time.delete(TimeMania.parameter, use: deleteHandler)
        time.get("search", use: searchHandler)
        time.get("first", use: getFirstHandler)
        time.get("sorted", use: sortedHandler)
    }
    
    func createManyHandlers(_ req: Request, games: [TimeMania]) throws -> Future<HTTPStatus> {
        var arr: [EventLoopFuture<TimeMania>] = []
        
        for i in games {
            arr.append(i.save(on: req))
        }
        return arr.flatten(on: req).transform(to: .created)
    }
    
    func createOneHandler(_ req: Request, game: TimeMania) throws -> Future<TimeMania> {
        return game.save(on: req)
    }
    
    
    func getHandler(_ req: Request) throws -> Future<TimeMania> {
        return try req.parameters.next(TimeMania.self)
    }
    
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(TimeMania.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[TimeMania]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        let arrOfSearchTerms = searchTerm.components(separatedBy: CharacterSet(charactersIn: "-"))
        let mappingSearchTermsToInt = arrOfSearchTerms.compactMap { Int($0) }
        
        
        return TimeMania.query(on: req).filter(\.all_Numbers, .contains, mappingSearchTermsToInt).all()
        
    }
    
    func getFirstHandler(_ req: Request) throws -> Future<TimeMania> {
        return TimeMania.query(on: req).first().map(to: TimeMania.self) { sena in
            guard let sena = sena else { throw Abort(.notFound) }
            return sena
        }
    }
    
    func sortedHandler(_ req: Request) throws -> Future<[TimeMania]> {
        return TimeMania.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[TimeMania]> {
        return TimeMania.query(on: req).all()
    }
}

