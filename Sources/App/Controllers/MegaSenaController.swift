//
//  MegaSenaController.swift
//  App
//
//  Created by Gabriel Soria Souza on 22/02/19.
//

import Vapor
import Fluent
import Foundation
import FluentSQL

struct MegaSenaController: RouteCollection {
    
    func boot(router: Router) throws {
        
        let megaSenaRouter = router.grouped("api", "megasena")
        megaSenaRouter.get(use: getAllHandler)
        megaSenaRouter.post([MegaSena].self, use: createManyHandlers)
        //megaSenaRouter.post(MegaSena.self, use: createOneHandler)
        megaSenaRouter.get(MegaSena.parameter, use: getHandler)
        //megaSenaRouter.put(MegaSena.parameter, use: updateHandler)
        megaSenaRouter.delete(MegaSena.parameter, use: deleteHandler)
        megaSenaRouter.get("search", use: searchHandler)
        megaSenaRouter.get("first", use: getFirstHandler)
        megaSenaRouter.get("sorted", use: sortedHandler)
        //megaSenaRouter.get("update", use: updateGames)
    }
    
//    func updateGames(_ req: Request) throws -> EventLoopFuture<Response> {
//        let res = try! req.client().get("https://confiraloterias.com.br/api0/json.php?loteria=megasena&token=MkQyfFEFODgk3A3")
//
//        let response = res.flatMap {
//            try! $0.content.decode(SenaConcourseData.self)
//        }
//        
//        let oi = response.map {
//            let oii = LotteryNetworkingWorker(lotteryGameString: "megasena", lotteryGame: .megasena, lotteryGameNoSpace: .megasena, concourseNumber: $0.concurso.numero, numbers: $0.concurso.dezenas, date: $0.concurso.data, accumulatedValue: $0.concurso.valor_acumulado, prize: $0.concurso.premiacao.sena.valor_pago, winners: $0.concurso.premiacao.sena.ganhadores, duplaSenaSecondSetOfNumbers: nil, teamOrDay: nil, duplaSenaTeamOrDayPrize: nil, duplaSenaTeamOrDayWinners: nil, federalPrize: nil)
//            let ooo = req.future(oii)
//            
//        }
//        
//
//
//
//        return res
//
//    }
    
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
        let arrOfSearchTerms = searchTerm.components(separatedBy: CharacterSet(charactersIn: "-"))
        let mappingSearchTermsToInt = arrOfSearchTerms.compactMap { Int($0) }
        
        
        return MegaSena.query(on: req).filter(\.all_numbers, .contains, mappingSearchTermsToInt).all()

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
