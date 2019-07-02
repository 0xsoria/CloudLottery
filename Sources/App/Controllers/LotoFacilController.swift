//
//  LotoFacilController.swift
//  App
//
//  Created by Gabriel Soria Souza on 02/03/19.
//

import Vapor
import Fluent

struct LotoFacilController: RouteCollection {
    
    func boot(router: Router) throws {
        let lotofacilRouter = router.grouped("api", "lotofacil")
        lotofacilRouter.get(use: getAllHandler)
        lotofacilRouter.post([LotoFacil].self, use: createManyHandlers)
        //lotofacilRouter.post(LotoFacil.self, use: createOneHandler)
        lotofacilRouter.get(LotoFacil.parameter, use: getHandler)
        lotofacilRouter.put(LotoFacil.parameter, use: updateHandler)
        //lotofacilRouter.delete(LotoFacil.parameter, use: deleteHandler)
        lotofacilRouter.get("search", use: searchHandler)
        lotofacilRouter.get("first", use: getFirstHandler)
        lotofacilRouter.get("sorted", use: sortedHandler)
    }
    
    func createManyHandlers(_ req: Request, games: [LotoFacil]) throws -> Future<HTTPStatus> {
        var arr: [EventLoopFuture<LotoFacil>] = []
        
        for i in games {
            arr.append(i.save(on: req))
        }
        return arr.flatten(on: req).transform(to: .created)
    }
    
    func createOneHandler(_ req: Request, game: LotoFacil) throws -> Future<LotoFacil> {
        return game.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<LotoFacil> {
        return try req.parameters.next(LotoFacil.self)
    }
    
    func updateHandler(_ req: Request) throws -> Future<LotoFacil> {
        return try flatMap(to: LotoFacil.self, req.parameters.next(LotoFacil.self), req.content.decode(LotoFacil.self)) { game, updatedGame in
            
            game.numberOfTheGame = updatedGame.numberOfTheGame
            game.data_sorteio = updatedGame.data_sorteio
            game.bola_um = updatedGame.bola_um
            game.bola_dois = updatedGame.bola_dois
            game.bola_tres = updatedGame.bola_tres
            game.bola_quatro = updatedGame.bola_quatro
            game.bola_cinco = updatedGame.bola_cinco
            game.bola_seis = updatedGame.bola_seis
            
            game.bola_sete                              = updatedGame.bola_sete
            game.bola_oito                              = updatedGame.bola_oito
            game.bola_nove                              = updatedGame.bola_nove
            game.bola_dez                               = updatedGame.bola_dez
            game.bola_onze                              = updatedGame.bola_onze
            game.bola_doze                              = updatedGame.bola_doze
            game.bola_treze                             = updatedGame.bola_treze
            game.bola_catorze                           = updatedGame.bola_catorze
            game.bola_quinze                            = updatedGame.bola_quinze
            game.all_numbers                            = updatedGame.all_numbers
            game.all_numbers_str                        = updatedGame.all_numbers_str
            game.arrecadacao_total                      = updatedGame.arrecadacao_total
            game.ganhadores_quinze_numeros              = updatedGame.ganhadores_quinze_numeros
            game.cidade                                 = updatedGame.cidade
            game.uf                                     = updatedGame.uf
            game.ganhadores_catorze_numeros             = updatedGame.ganhadores_catorze_numeros
            game.ganhadores_treze_numeros               = updatedGame.ganhadores_treze_numeros
            game.ganhadores_doze_numeros                = updatedGame.ganhadores_doze_numeros
            game.ganhadores_onze_numeros                = updatedGame.ganhadores_onze_numeros
            game.valor_rateio_quinze_numeros            = updatedGame.valor_rateio_quinze_numeros
            game.valor_rateio_catorze_numeros           = updatedGame.valor_rateio_catorze_numeros
            game.valor_rateio_treze_numeros             = updatedGame.valor_rateio_treze_numeros
            game.valor_rateio_doze_numeros              = updatedGame.valor_rateio_doze_numeros
            game.valor_rateio_onze_numeros              = updatedGame.valor_rateio_onze_numeros
            game.acumulado_quinze_numeros               = updatedGame.acumulado_quinze_numeros
            game.estimativa_premio                      = updatedGame.estimativa_premio
            game.valor_acumulado_especial               = updatedGame.valor_acumulado_especial
            
            return game.save(on: req)
        }
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(LotoFacil.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    func searchHandler(_ req: Request) throws -> Future<[LotoFacil]> {
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        let arrOfSearchTerms = searchTerm.components(separatedBy: CharacterSet(charactersIn: "-"))
        let mappingSearchTermsToInt = arrOfSearchTerms.compactMap { Int($0) }
        
        return LotoFacil.query(on: req).filter(\.all_numbers, .contains, mappingSearchTermsToInt).all()
        
        }
    
    func getFirstHandler(_ req: Request) throws -> Future<LotoFacil> {
        return LotoFacil.query(on: req).first().map(to: LotoFacil.self) { game in
            guard let game = game else { throw Abort(.notFound) }
            return game
        }
    }
    
    func sortedHandler(_ req: Request) throws -> Future<[LotoFacil]> {
        return LotoFacil.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[LotoFacil]> {
        return LotoFacil.query(on: req).all()
    }
}

