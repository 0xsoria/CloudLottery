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
    
    router.post("api", "megasena") { req -> Future<MegaSenaPastGame> in
        return try req.content.decode(MegaSenaPastGame.self)
            .flatMap(to: MegaSenaPastGame.self) { game in
                return game.save(on: req)
        }
    }
    
    router.get("api", "megasena") { req -> Future<[MegaSenaPastGame]> in
        return MegaSenaPastGame.query(on: req).all()
    }
    
    router.get("api", "megasena", MegaSenaPastGame.parameter) { req -> Future<MegaSenaPastGame> in
        return try req.parameters.next(MegaSenaPastGame.self)
    }
    router.put("api", "megasena", MegaSenaPastGame.parameter) { req -> Future<MegaSenaPastGame> in
        return try flatMap(to: MegaSenaPastGame.self, req.parameters.next(MegaSenaPastGame.self), req.content.decode(MegaSenaPastGame.self)) {
            game, updateGame in
            
            //game.numberOfTheGame = updateGame.numberOfTheGame
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
    
    router.delete("api", "megasena", MegaSenaPastGame.parameter) { req -> Future<HTTPStatus> in
        return try req.parameters.next(MegaSenaPastGame.self)
                    .delete(on: req)
                    .transform(to: HTTPStatus.noContent)
    }
    
    router.get("api", "megasena", "search") { req -> Future<[MegaSenaPastGame]> in
        guard let searchTerm = req.query[String.self, at: "term"] else {
            throw Abort(.badRequest)
        }
        return MegaSenaPastGame.query(on: req).filter(\.allNumbersString == searchTerm).all()
    }
    
    router.get("api", "megasena", "first") { req -> Future<MegaSenaPastGame> in
        return MegaSenaPastGame.query(on: req).first().map(to: MegaSenaPastGame.self) { game in
            guard let game = game else {
                throw Abort(.notFound)
            }
            return game
        }
    }
    
    router.get("api", "megasena", "sorted") { req -> Future<[MegaSenaPastGame]> in
        return MegaSenaPastGame.query(on: req).sort(\.data_sorteio, .ascending).all()
    }
    
    
}
