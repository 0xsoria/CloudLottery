//
//  QuinaController.swift
//  App
//
//  Created by Gabriel Soria Souza on 28/02/19.
//

import Vapor
import Fluent

struct QuinaController: RouteCollection {
    
    func boot(router: Router) throws {
        
        let quinaRouter = router.grouped("api", "quina")
        quinaRouter.get(use: getAllHandler)
        quinaRouter.post([Quina].self, use: createManyHandlers)
        //quinaRouter.post(Quina.self, use: createOneHandler)
        quinaRouter.get(Quina.parameter, use: getHandler)
        //quinaRouter.put(Quina.parameter, use: updateHandler)
        quinaRouter.delete(Quina.parameter, use: deleteHandler)
        quinaRouter.get("search", use: searchHandler)
        quinaRouter.get("first", use: getFirstHandler)
        quinaRouter.get("sorted", use: sortedHandler)
        
    }
    
    func createManyHandlers(_ req: Request, games: [Quina]) throws -> Future<HTTPStatus> {
        var arr: [EventLoopFuture<Quina>] = []
        
        for i in games {
            arr.append(i.save(on: req))
        }
        return arr.flatten(on: req).transform(to: .created)
    }
    
//    func createOneHandler(_ req: Request, game: Quina) throws -> Future<Quina> {
//        return game.save(on: req)
//    }
    
    
    func getHandler(_ req: Request) throws -> Future<Quina> {
        return try req.parameters.next(Quina.self)
    }
    
    func updateHandler(_ req: Request) throws -> Future<Quina> {
        return try flatMap(
            to: Quina.self,
            req.parameters.next(Quina.self),
            req.content.decode(Quina.self)) { game, updateGame in
                game.numberOfTheGame = updateGame.numberOfTheGame
                game.data_sorteio = updateGame.data_sorteio
                game.dezena_um = updateGame.dezena_um
                game.dezena_dois = updateGame.dezena_dois
                game.dezena_tres = updateGame.dezena_tres
                game.dezena_quatro = updateGame.dezena_quatro
                game.dezena_cinco = updateGame.dezena_cinco
                game.all_numbers = updateGame.all_numbers
                game.all_numbers_str = updateGame.all_numbers_str
                game.arrecadacao_total = updateGame.arrecadacao_total
                game.ganhadores_quina = updateGame.ganhadores_quina
                game.cidade = updateGame.cidade
                game.uf = updateGame.uf
                game.rateio_quina = updateGame.rateio_quina
                game.ganhadores_quadra = updateGame.ganhadores_quadra
                game.acumulado = updateGame.acumulado
                game.valor_acumulado = updateGame.valor_acumulado
                game.estimativa_premio = updateGame.estimativa_premio
                game.valor_acumulado_sorteio_especial_sao_joao = updateGame.valor_acumulado_sorteio_especial_sao_joao
                return game.save(on: req)
        }
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Quina.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[Quina]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        
        let arrOfSearchTerms = searchTerm.components(separatedBy: CharacterSet(charactersIn: "-"))
        let mappingSearchTermsToInt = arrOfSearchTerms.compactMap { Int($0) }
        
        return Quina.query(on: req).filter(\.all_numbers, .contains, mappingSearchTermsToInt).all()
        
    }
    
    func getFirstHandler(_ req: Request) throws -> Future<Quina> {
        return Quina.query(on: req).first().map(to: Quina.self) { sena in
            guard let sena = sena else { throw Abort(.notFound) }
            return sena
        }
    }
    
    func sortedHandler(_ req: Request) throws -> Future<[Quina]> {
        return Quina.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[Quina]> {
        return Quina.query(on: req).all()
    }
    
}
