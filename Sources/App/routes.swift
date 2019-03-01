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
    
    let megaSenaController = MegaSenaController()
    try router.register(collection: megaSenaController)
    let quinaController = QuinaController()
    try router.register(collection: quinaController)
    
    
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
    
    router.post("api", "estatisticas", "quina") { req -> Future<QuinaStatistics> in
        return try req.content.decode(QuinaStatistics.self)
            .flatMap(to: QuinaStatistics.self) { stats in
                return stats.save(on: req)
        }
    }
    
    router.get("api", "estatisticas", "quina") { req -> Future<[QuinaStatistics]> in
        return QuinaStatistics.query(on: req).all()
    }
    
    
    
    router.put("api", "estatisticas", "quina", QuinaStatistics.parameter) { req -> Future<QuinaStatistics> in
        return try flatMap(to: QuinaStatistics.self, req.parameters.next(QuinaStatistics.self), req.content.decode(QuinaStatistics.self)) { game, updateGame in
            game.one = updateGame.one
            //to be done
            return game.save(on: req)
            
        }
    }
    
    router.delete("api", "estatisticas", "quina", QuinaStatistics.parameter) { req -> Future<HTTPStatus> in
        return try req.parameters.next(QuinaStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    router.post("api", "estatisticas", "lotofacil") { req -> Future<LotoFacilStatistics> in
        return try req.content.decode(LotoFacilStatistics.self)
            .flatMap(to: LotoFacilStatistics.self) { stats in
                return stats.save(on: req)
        }
    }
    
    router.get("api", "estatisticas", "lotofacil") { req -> Future<[LotoFacilStatistics]> in
        return LotoFacilStatistics.query(on: req).all()
    }
    
    
    
    router.put("api", "estatisticas", "lotofacil", LotoFacilStatistics.parameter) { req -> Future<LotoFacilStatistics> in
        return try flatMap(to: LotoFacilStatistics.self, req.parameters.next(LotoFacilStatistics.self), req.content.decode(LotoFacilStatistics.self)) { game, updateGame in
            game.one = updateGame.one
            //to be done
            return game.save(on: req)
            
        }
    }
    
    router.delete("api", "estatisticas", "lotofacil", LotoFacilStatistics.parameter) { req -> Future<HTTPStatus> in
        return try req.parameters.next(LotoFacilStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
    
    
    
}
