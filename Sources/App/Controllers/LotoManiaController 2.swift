//
//  LotoManiaController.swift
//  App
//
//  Created by Gabriel Soria Souza on 20/05/19.
//

import Vapor
import Fluent

struct LotoManiaController: RouteCollection {
    
    func boot(router: Router) throws {
        let mania = router.grouped("api", "lotomania")
        mania.get(use: getAllHandler)
        //mania.post([LotoMania].self, use: createManyHandlers)
        //mania.post(LotoMania.self, use: createOneHandler)
        mania.get(LotoMania.parameter, use: getHandler)
        //mania.delete(LotoMania.parameter, use: deleteHandler)
        mania.get("search", use: searchHandler)
        mania.get("first", use: getFirstHandler)
        mania.get("sorted", use: sortedHandler)
    }
    
    func createManyHandlers(_ req: Request, games: [LotoMania]) throws -> Future<HTTPStatus> {
        var arr: [EventLoopFuture<LotoMania>] = []
        
        for i in games {
            arr.append(i.save(on: req))
        }
        return arr.flatten(on: req).transform(to: .created)
    }
    
    func createOneHandler(_ req: Request, game: LotoMania) throws -> Future<LotoMania> {
        return game.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<LotoMania> {
        return try req.parameters.next(LotoMania.self)
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(LotoMania.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[LotoMania]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        let arrOfSearchTerms = searchTerm.components(separatedBy: CharacterSet(charactersIn: "-"))
        let mappingSearchTermsToInt = arrOfSearchTerms.compactMap { Int($0) }
        
        return LotoMania.query(on: req).filter(\.all_numbers, .contains, mappingSearchTermsToInt).all()
        
    }
    
    func getFirstHandler(_ req: Request) throws -> Future<LotoMania> {
        return LotoMania.query(on: req).first().map(to: LotoMania.self) { game in
            guard let game = game else { throw Abort(.notFound) }
            return game
        }
    }
    
    func sortedHandler(_ req: Request) throws -> Future<[LotoMania]> {
        return LotoMania.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[LotoMania]> {
        return LotoMania.query(on: req).all()
    }
}

