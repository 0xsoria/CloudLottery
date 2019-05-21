//
//  DuplaSena.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import FluentPostgreSQL

final class DuplaSena: Codable {
    var id                                                  : Int?
    var concurso                                            : Int
    var numberOfTheGame                                     : Int
    var data_sorteio                                        : String
    var numero_um_sorteio_um                                : Int
    var numero_dois_sorteio_um                              : Int
    var numero_tres_sorteio_um                              : Int
    var numero_quatro_sorteio_um                            : Int
    var numero_cinco_sorteio_um                             : Int
    var numero_seis_sorteio_um                              : Int
    var all_Numbers                                         : [Int]
    var arrecadacao_total                                   : String
    var ganhadores_sena_sorteio_um                          : Int
    var cidade                                              : String
    var uf                                                  : String
    var rateio_sena_sorteio_um                              : String
    var acumulado_sena_sorteio_um                           : String
    var valor_acumulado_sena_sorteio_um                     : String
    var rateio_quina_sorteio_um                             : String
    var ganhadores_quadra_sorteio_um                        : Int
    var rateio_quadra_sorteio_um                            : String
    var ganhadores_terno_sorteio_um                         : Int
    var rateio_terno_sorteio_um                             : String
    var numero_um_sorteio_dois                              : Int
    var numero_dois_sorteio_dois                            : Int
    var numero_tres_sorteio_dois                            : Int
    var numero_quatro_sorteio_dois                          : Int
    var numero_cinco_sorteio_dois                           : Int
    var numero_seis_sorteio_dois                            : Int
    var all_Numbers_dois                                    : [Int]
    var all_numbers_str_dois                                : String
    var ganhadores_sena_sorteio_dois                        : Int
    var rateio_sena_sorteio_dois                            : String
    var ganhadores_quina_sorteio_dois                       : Int
    var rateio_quina_sorteio_dois                           : String
    var ganhadores_quadra_sorteio_dois                      : Int
    var rateio_quadra_sorteio_dois                          : String
    var ganhadores_terno_sorteio_dois                       : Int
    var rateio_terno_sorteio_dois                           : String
    var estimativa_premio                                   : String
    var acumulado_especial_pascoa                           : String
    
    init(
        id                                                  : Int?,
        concurso                                            : Int,
        numberOfTheGame                                     : Int,
        data_sorteio                                        : String,
        numero_um_sorteio_um                                : Int,
        numero_dois_sorteio_um                              : Int,
        numero_tres_sorteio_um                              : Int,
        numero_quatro_sorteio_um                            : Int,
        numero_cinco_sorteio_um                             : Int,
        numero_seis_sorteio_um                              : Int,
        all_Numbers                                         : [Int],
        arrecadacao_total                                   : String,
        ganhadores_sena_sorteio_um                          : Int,
        cidade                                              : String,
        uf                                                  : String,
        rateio_sena_sorteio_um                              : String,
        acumulado_sena_sorteio_um                           : String,
        valor_acumulado_sena_sorteio_um                     : String,
        rateio_quina_sorteio_um                             : String,
        ganhadores_quadra_sorteio_um                        : Int,
        rateio_quadra_sorteio_um                            : String,
        ganhadores_terno_sorteio_um                         : Int,
        rateio_terno_sorteio_um                             : String,
        numero_um_sorteio_dois                              : Int,
        numero_dois_sorteio_dois                            : Int,
        numero_tres_sorteio_dois                            : Int,
        numero_quatro_sorteio_dois                          : Int,
        numero_cinco_sorteio_dois                           : Int,
        numero_seis_sorteio_dois                            : Int,
        all_Numbers_dois                                    : [Int],
        all_numbers_str_dois                                : String,
        ganhadores_sena_sorteio_dois                        : Int,
        rateio_sena_sorteio_dois                            : String,
        ganhadores_quina_sorteio_dois                       : Int,
        rateio_quina_sorteio_dois                           : String,
        ganhadores_quadra_sorteio_dois                      : Int,
        rateio_quadra_sorteio_dois                          : String,
        ganhadores_terno_sorteio_dois                       : Int,
        rateio_terno_sorteio_dois                           : String,
        estimativa_premio                                   : String,
        acumulado_especial_pascoa                           : String
        
        ) {
        
        
        
        self.id = id
        self.concurso = concurso
        self.numberOfTheGame = numberOfTheGame
        self.data_sorteio = data_sorteio
        self.numero_um_sorteio_um = numero_um_sorteio_um
        self.numero_dois_sorteio_um = numero_dois_sorteio_um
        self.numero_tres_sorteio_um = numero_tres_sorteio_um
        self.numero_quatro_sorteio_um = numero_quatro_sorteio_um
        self.numero_cinco_sorteio_um = numero_cinco_sorteio_um
        self.numero_seis_sorteio_um = numero_seis_sorteio_um
        self.all_Numbers = all_Numbers
        self.arrecadacao_total = arrecadacao_total
        self.ganhadores_sena_sorteio_um = ganhadores_sena_sorteio_um
        self.cidade = cidade
        self.uf = uf
        self.rateio_sena_sorteio_um = rateio_sena_sorteio_um
        self.acumulado_sena_sorteio_um = acumulado_sena_sorteio_um
        self.valor_acumulado_sena_sorteio_um = valor_acumulado_sena_sorteio_um
        self.rateio_quina_sorteio_um = rateio_quina_sorteio_um
        self.ganhadores_quadra_sorteio_um = ganhadores_quadra_sorteio_um
        self.rateio_quadra_sorteio_um = rateio_quadra_sorteio_um
        self.ganhadores_terno_sorteio_um = ganhadores_terno_sorteio_um
        self.rateio_terno_sorteio_um = rateio_terno_sorteio_um
        self.numero_um_sorteio_dois = numero_um_sorteio_dois
        self.numero_dois_sorteio_dois = numero_dois_sorteio_dois
        self.numero_tres_sorteio_dois = numero_tres_sorteio_dois
        self.numero_quatro_sorteio_dois = numero_quatro_sorteio_dois
        self.numero_cinco_sorteio_dois = numero_cinco_sorteio_dois
        self.numero_seis_sorteio_dois = numero_seis_sorteio_dois
        self.all_Numbers_dois = all_Numbers_dois
        self.all_numbers_str_dois = all_numbers_str_dois
        self.ganhadores_sena_sorteio_dois = ganhadores_sena_sorteio_dois
        self.rateio_sena_sorteio_dois = rateio_sena_sorteio_dois
        self.ganhadores_quina_sorteio_dois = ganhadores_quina_sorteio_dois
        self.rateio_quina_sorteio_dois = rateio_quina_sorteio_dois
        self.ganhadores_quadra_sorteio_dois = ganhadores_quadra_sorteio_dois
        self.rateio_quadra_sorteio_dois = rateio_quadra_sorteio_dois
        self.ganhadores_terno_sorteio_dois = ganhadores_terno_sorteio_dois
        self.rateio_terno_sorteio_dois = rateio_terno_sorteio_dois
        self.estimativa_premio = estimativa_premio
        self.acumulado_especial_pascoa = acumulado_especial_pascoa
        
    }
    
}

extension DuplaSena: PostgreSQLModel {}
extension DuplaSena: Migration {}
extension DuplaSena: Content {}
extension DuplaSena: Parameter {}
