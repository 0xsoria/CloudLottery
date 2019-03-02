//
//  MegaSenaController.swift
//  App
//
//  Created by Gabriel Soria Souza on 22/02/19.
//

import Vapor
import Fluent

struct MegaSenaController: RouteCollection {
    
    func boot(router: Router) throws {
        
        let megaSenaRouter = router.grouped("api", "megasena")
        megaSenaRouter.get(use: getAllHandler)
        megaSenaRouter.post([MegaSena].self, use: createManyHandlers)
        //megaSenaRouter.post(MegaSena.self, use: createOneHandler)
        megaSenaRouter.get(MegaSena.parameter, use: getHandler)
        megaSenaRouter.put(MegaSena.parameter, use: updateHandler)
        megaSenaRouter.delete(MegaSena.parameter, use: deleteHandler)
        megaSenaRouter.get("search", use: searchHandler)
        megaSenaRouter.get("first", use: getFirstHandler)
        megaSenaRouter.get("sorted", use: sortedHandler)
    }
    
    func createManyHandlers(_ req: Request, games: [MegaSena]) throws -> Future<HTTPStatus> {
        var arr: [EventLoopFuture<MegaSena>] = []
        
        for i in games {
            arr.append(i.save(on: req))
        }
        return arr.flatten(on: req).transform(to: .created)
    }
    
    func createOneHandler(_ req: Request, game: MegaSena) throws -> Future<MegaSena> {
        return game.save(on: req)
    }

    
    func getHandler(_ req: Request) throws -> Future<MegaSena> {
        return try req.parameters.next(MegaSena.self)
    }
    
    func updateHandler(_ req: Request) throws -> Future<MegaSena> {
        return try flatMap(
            to: MegaSena.self,
        req.parameters.next(MegaSena.self),
        req.content.decode(MegaSena.self)) { game, updateGame in
            
            game.numberOfTheGame = updateGame.numberOfTheGame
            game.data_sorteio = updateGame.data_sorteio
            game.dezena_um = updateGame.dezena_um
            game.dezena_dois = updateGame.dezena_dois
            game.dezena_tres = updateGame.dezena_tres
            game.dezena_quatro = updateGame.dezena_quatro
            game.dezena_cinco = updateGame.dezena_cinco
            game.dezena_seis = updateGame.dezena_seis
            game.all_numbers = updateGame.all_numbers
            game.all_numbers_str = updateGame.all_numbers_str
            game.arrecadacao_total = updateGame.arrecadacao_total
            game.ganhadores_sena = updateGame.ganhadores_sena
            game.cidade = updateGame.cidade
            game.uf = updateGame.uf
            game.rateio_sena = updateGame.rateio_sena
            game.ganhadores_quina = updateGame.ganhadores_quina
            game.rateio_quina = updateGame.rateio_quina
            game.ganhadores_quadra = updateGame.ganhadores_quadra
            game.acumulado = updateGame.acumulado
            game.valor_acumulado = updateGame.valor_acumulado
            game.estimativa_premio = updateGame.estimativa_premio
            game.acumulado_mega_da_virada = updateGame.acumulado_mega_da_virada
            
            return game.save(on: req)
        }
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(MegaSena.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[MegaSena]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        return MegaSena.query(on: req).group(.or) { or in
            or.filter(\.all_numbers_str == searchTerm)}.all()
    }
    
    func getFirstHandler(_ req: Request) throws -> Future<MegaSena> {
        return MegaSena.query(on: req).first().map(to: MegaSena.self) { sena in
            guard let sena = sena else { throw Abort(.notFound) }
            return sena
        }
    }
    
    func sortedHandler(_ req: Request) throws -> Future<[MegaSena]> {
        return MegaSena.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[MegaSena]> {
        return MegaSena.query(on: req).all()
    }
}
