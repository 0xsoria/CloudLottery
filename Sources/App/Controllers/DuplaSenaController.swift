//
//  DuplaSenaController.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import Fluent
import Foundation
import FluentSQL

struct DuplaSenaController: RouteCollection {
    
    func boot(router: Router) throws {
        let dupla = router.grouped("api", "duplasena")
        dupla.get(use: getAllHandler)
        dupla.post([DuplaSena].self, use: createManyHandlers)
        //dupla.post(DuplaSena.self, use: createOneHandler)
        dupla.get(DuplaSena.parameter, use: getHandler)
        dupla.delete(DuplaSena.parameter, use: deleteHandler)
        dupla.get("search", use: searchHandler)
        dupla.get("first", use: getFirstHandler)
        dupla.get("sorted", use: sortedHandler)
    }
    
    func createManyHandlers(_ req: Request, games: [DuplaSena]) throws -> Future<HTTPStatus> {
        var arr: [EventLoopFuture<DuplaSena>] = []
        
        for i in games {
            arr.append(i.save(on: req))
        }
        return arr.flatten(on: req).transform(to: .created)
    }
    
    func createOneHandler(_ req: Request, game: DuplaSena) throws -> Future<DuplaSena> {
        return game.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<DuplaSena> {
        return try req.parameters.next(DuplaSena.self)
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(DuplaSena.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[DuplaSena]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        let arrOfSearchTerms = searchTerm.components(separatedBy: CharacterSet(charactersIn: "-"))
        let mappingSearchTermsToInt = arrOfSearchTerms.compactMap { Int($0) }
        
        
        return DuplaSena.query(on: req).filter(\.all_Numbers, .contains, mappingSearchTermsToInt).all()
        
    }
    
    func getFirstHandler(_ req: Request) throws -> Future<DuplaSena> {
        return DuplaSena.query(on: req).first().map(to: DuplaSena.self) { sena in
            guard let sena = sena else { throw Abort(.notFound) }
            return sena
        }
    }
    
    func sortedHandler(_ req: Request) throws -> Future<[DuplaSena]> {
        return DuplaSena.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[DuplaSena]> {
        return DuplaSena.query(on: req).all()
    }
    
    
}
