//
//  TimeMania.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import FluentPostgreSQL

final class TimeMania: Codable {
    
    var id                                              : Int?
    var concurso                                        : Int
    var numberOfTheGame                                 : Int
    var data_sorteio                                    : String
    var bola_um                                         : Int
    var bola_dois                                       : Int
    var bola_tres                                       : Int
    var bola_quatro                                     : Int
    var bola_cinco                                      : Int
    var bola_seis                                       : Int
    var all_Numbers                                     : [Int]
    var all_Numbers_str                                 : String
    var time_coracao                                    : String
    var valor_arrecadado                                : String
    var ganhadores_sete_numeros                         : Int
    var cidade                                          : String
    var uf                                              : String
    var ganhadores_seis_numeros                         : Int
    var ganhadores_cinco_numeros                        : Int
    var ganhadores_quatro_numeros                       : Int
    var ganhadores_tres_numeros                         : Int
    var ganhadores_time_do_coracao                      : Int
    var valor_rateio_sete_numeros                       : String
    var valor_rateio_seis_numeros                       : String
    var valor_rateio_cinco_numeros                      : String
    var valor_rateio_quatro_numeros                     : String
    var valor_rateio_tres_numeros                       : String
    var valor_time_do_coracao                           : String
    var valor_acumulado                                 : String
    var estimativa_premio                               : String
    
    
    init(id                                              : Int,
         concurso                                        : Int,
         numberOfTheGame                                 : Int,
         data_sorteio                                    : String,
         bola_um                                         : Int,
         bola_dois                                       : Int,
         bola_tres                                       : Int,
         bola_quatro                                     : Int,
         bola_cinco                                      : Int,
         bola_seis                                       : Int,
         all_Numbers                                     : [Int],
         all_Numbers_str                                 : String,
         time_coracao                                    : String,
         valor_arrecadado                                : String,
         ganhadores_sete_numeros                         : Int,
         cidade                                          : String,
         uf                                              : String,
         ganhadores_seis_numeros                         : Int,
         ganhadores_cinco_numeros                        : Int,
         ganhadores_quatro_numeros                       : Int,
         ganhadores_tres_numeros                         : Int,
         ganhadores_time_do_coracao                      : Int,
         valor_rateio_sete_numeros                       : String,
         valor_rateio_seis_numeros                       : String,
         valor_rateio_cinco_numeros                      : String,
         valor_rateio_quatro_numeros                     : String,
         valor_rateio_tres_numeros                       : String,
         valor_time_do_coracao                           : String,
         valor_acumulado                                 : String,
         estimativa_premio                               : String
        ) {
        
        
        
        self.id = id
        self.concurso = concurso
        self.numberOfTheGame = numberOfTheGame
        self.data_sorteio = data_sorteio
        self.bola_um = bola_um
        self.bola_dois = bola_dois
        self.bola_tres = bola_tres
        self.bola_quatro = bola_quatro
        self.bola_cinco = bola_cinco
        self.bola_seis = bola_seis
        self.all_Numbers = all_Numbers
        self.all_Numbers_str = all_Numbers_str
        self.time_coracao = time_coracao
        self.valor_arrecadado = valor_arrecadado
        self.ganhadores_sete_numeros = ganhadores_sete_numeros
        self.cidade = cidade
        self.uf = uf
        self.ganhadores_seis_numeros = ganhadores_seis_numeros
        self.ganhadores_cinco_numeros = ganhadores_cinco_numeros
        self.ganhadores_quatro_numeros = ganhadores_quatro_numeros
        self.ganhadores_tres_numeros = ganhadores_tres_numeros
        self.ganhadores_time_do_coracao = ganhadores_time_do_coracao
        self.valor_rateio_sete_numeros = valor_rateio_sete_numeros
        self.valor_rateio_seis_numeros = valor_rateio_seis_numeros
        self.valor_rateio_cinco_numeros = valor_rateio_cinco_numeros
        self.valor_rateio_quatro_numeros = valor_rateio_quatro_numeros
        self.valor_rateio_tres_numeros = valor_rateio_tres_numeros
        self.valor_time_do_coracao = valor_time_do_coracao
        self.valor_acumulado = valor_acumulado
        self.estimativa_premio = estimativa_premio
        
    }
    
    
}



extension TimeMania: PostgreSQLModel {}
extension TimeMania: Migration {}
extension TimeMania: Content {}
extension TimeMania: Parameter {}
