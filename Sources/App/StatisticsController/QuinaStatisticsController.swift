//
//  QuinaStatisticsController.swift
//  App
//
//  Created by Gabriel Soria Souza on 02/03/19.
//

import Vapor
import Fluent

struct QuinaStatisticsController: RouteCollection {
    func boot(router: Router) throws {
        
        let quina = router.grouped("api", "estatisticas", "quina")
        quina.get(use: getAllHandler)
        quina.post(QuinaStatistics.self, use: createOneHandler)
        quina.delete(QuinaStatistics.parameter, use: deleteHandler)
    }
    
    func createOneHandler(_ req: Request, stats: QuinaStatistics) throws -> Future<QuinaStatistics> {
        return stats.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<QuinaStatistics> {
        return try req.parameters.next(QuinaStatistics.self)
    }
    
    func updateHandler(_ req: Request) throws -> Future<QuinaStatistics> {
        return try flatMap(to: QuinaStatistics.self, req.parameters.next(QuinaStatistics.self), req.content.decode(QuinaStatistics.self)) { stat, updatedStat in
            
            stat.one                =      updatedStat.one
            stat.two                =      updatedStat.two
            stat.three              =      updatedStat.three
            stat.four               =      updatedStat.four
            stat.five               =      updatedStat.five
            stat.six                =      updatedStat.six
            stat.seven              =      updatedStat.seven
            stat.eight              =      updatedStat.eight
            stat.nine               =      updatedStat.nine
            stat.tem                =      updatedStat.tem
            stat.eleven             =      updatedStat.eleven
            stat.twelve             =      updatedStat.twelve
            stat.thirteen           =      updatedStat.thirteen
            stat.fourteen           =      updatedStat.fourteen
            stat.fifteen            =      updatedStat.fifteen
            stat.sixteen            =      updatedStat.sixteen
            stat.seventeen          =      updatedStat.seventeen
            stat.eighteen           =      updatedStat.eighteen
            stat.nineeen            =      updatedStat.nineeen
            stat.twenty             =      updatedStat.twenty
            stat.twenty_one         =      updatedStat.twenty_one
            stat.twenty_two         =      updatedStat.twenty_two
            stat.twenty_three       =      updatedStat.twenty_three
            stat.twenty_four        =      updatedStat.twenty_four
            stat.twenty_five        =      updatedStat.twenty_five
            stat.twenty_six         =      updatedStat.twenty_six
            stat.twenty_seven       =      updatedStat.twenty_seven
            stat.twenty_eight       =      updatedStat.twenty_eight
            stat.twenty_nine        =      updatedStat.twenty_nine
            stat.thirdy             =      updatedStat.thirdy
            stat.thirdy_one         =      updatedStat.thirdy_one
            stat.thirdy_two         =      updatedStat.thirdy_two
            stat.thirdy_three       =      updatedStat.thirdy_three
            stat.thirdy_four        =      updatedStat.thirdy_four
            stat.thirdy_five        =      updatedStat.thirdy_five
            stat.thirdy_six         =      updatedStat.thirdy_six
            stat.thirdy_seven       =      updatedStat.thirdy_seven
            stat.thirdy_eight       =      updatedStat.thirdy_eight
            stat.thirdy_nine        =      updatedStat.thirdy_nine
            stat.forty              =      updatedStat.forty
            stat.forty_one          =      updatedStat.forty_one
            stat.forty_two          =      updatedStat.forty_two
            stat.forty_three        =      updatedStat.forty_three
            stat.forty_four         =      updatedStat.forty_four
            stat.forty_five         =      updatedStat.forty_five
            stat.forty_six          =      updatedStat.forty_six
            stat.forty_seven        =      updatedStat.forty_seven
            stat.forty_eight        =      updatedStat.forty_eight
            stat.forty_nine         =      updatedStat.forty_nine
            stat.fifty              =      updatedStat.fifty
            stat.fifty_one          =      updatedStat.fifty_one
            stat.fifty_two          =      updatedStat.fifty_two
            stat.fifty_three        =      updatedStat.fifty_three
            stat.fifty_four         =      updatedStat.fifty_four
            stat.fifty_five         =      updatedStat.fifty_five
            stat.fifty_six          =      updatedStat.fifty_six
            stat.fifty_seven        =      updatedStat.fifty_seven
            stat.fifty_eight        =      updatedStat.fifty_eight
            stat.fifty_nine         =      updatedStat.fifty_nine
            stat.sixty              =      updatedStat.sixty
            stat.sixty_one          =      updatedStat.sixty_one
            stat.sixty_two          =      updatedStat.sixty_two
            stat.sixty_three        =      updatedStat.sixty_three
            stat.sixty_four         =      updatedStat.sixty_four
            stat.sixty_five         =      updatedStat.sixty_five
            stat.sixty_six          =      updatedStat.sixty_six
            stat.sixty_seven        =      updatedStat.sixty_seven
            stat.sixty_eight        =      updatedStat.sixty_eight
            stat.sixty_nine         =      updatedStat.sixty_nine
            stat.seventy            =      updatedStat.seventy
            stat.seventy_one        =      updatedStat.seventy_one
            stat.seventy_two        =      updatedStat.seventy_two
            stat.seventy_three      =      updatedStat.seventy_three
            stat.seventy_four       =      updatedStat.seventy_four
            stat.seventy_five       =      updatedStat.seventy_five
            stat.seventy_six        =      updatedStat.seventy_six
            stat.seventy_seven      =      updatedStat.seventy_seven
            stat.seventy_eight      =      updatedStat.seventy_eight
            stat.seventy_nine       =      updatedStat.seventy_nine
            stat.eighty             =      updatedStat.eighty
            
           return stat.save(on: req)
        }
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[QuinaStatistics]> {
        return QuinaStatistics.query(on: req).all()
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(QuinaStatistics.self).delete(on: req).transform(to: HTTPStatus.noContent)
    }
}
