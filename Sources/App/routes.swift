import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.post("api", "sena") { req -> Future<MegaSena> in
        return try req.content.decode(MegaSena.self)
            .flatMap(to: MegaSena.self) { game in
                return game.save(on: req)
        }
    }
    
    router.get("api", "sena") { req -> Future<[MegaSena]> in
        return MegaSena.query(on: req).all()
    }
    
    router.get("api", "sena", MegaSena.parameter) { req -> Future<MegaSena> in
        return try req.parameters.next(MegaSena.self)
    }
    router.put("api", "sena", MegaSena.parameter) { req -> Future<MegaSena> in
        return try flatMap(to: MegaSena.self, req.parameters.next(MegaSena.self), req.content.decode(MegaSena.self)) {
            game, updateGame in
            
            game.numberOfTheGame = updateGame.numberOfTheGame
            game.data_sorteio = updateGame.data_sorteio
            game.dezena_um = updateGame.dezena_um
            game.dezena_dois = updateGame.dezena_dois
            game.dezena_tres = updateGame.dezena_tres
            game.dezena_quatro = updateGame.dezena_quatro
            game.dezena_cinco = updateGame.dezena_cinco
            game.dezena_seis = updateGame.dezena_seis
            game.all_numbers = updateGame.all_numbers
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
            game.allNumbersString = updateGame.allNumbersString
            
            return game.save(on: req)
        }
    }
    
    router.delete("api", "sena", MegaSena.parameter) { req -> Future<HTTPStatus> in
        return try req.parameters.next(MegaSena.self)
                    .delete(on: req)
                    .transform(to: HTTPStatus.noContent)
    }
    
    router.get("api", "sena", "search") { req -> Future<[MegaSena]> in
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        return MegaSena.query(on: req).filter(\.allNumbersString == searchTerm).all()
    }
    
    router.get("api", "sena", "first") { req -> Future<MegaSena> in
        return MegaSena.query(on: req).first().map(to: MegaSena.self) { game in
            guard let game = game else {
                throw Abort(.notFound)
            }
            return game
        }
    }
    
    router.get("api", "sena", "sorted") { req -> Future<[MegaSena]> in
        return MegaSena.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    router.post("api", "estatisticas", "megasena") { req -> Future<MegaSenaStatistics> in
        return try req.content.decode(MegaSenaStatistics.self)
            .flatMap(to: MegaSenaStatistics.self) { stats in
                return stats.save(on: req)
        }
    }
    
    router.get("api", "estatisticas", "megasena") { req -> Future<[MegaSenaStatistics]> in
        return MegaSenaStatistics.query(on: req).all()
    }
    
    
    
    router.put("api", "estatisticas", "megasena", MegaSenaStatistics.parameter) { req -> Future<MegaSenaStatistics> in
        return try flatMap(to: MegaSenaStatistics.self, req.parameters.next(MegaSenaStatistics.self), req.content.decode(MegaSenaStatistics.self)) { game, updateGame in
            game.one = updateGame.one
            //to be done
            return game.save(on: req)
            
        }
    }
    
    router.delete("api", "estatisticas", "megasena", MegaSenaStatistics.parameter) { req -> Future<HTTPStatus> in
        return try req.parameters.next(MegaSenaStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    
    
}
