//
//  LotoManiaStatistics.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import FluentPostgreSQL

final class LotoMania: Codable {
    var id                                                  : Int?
    var concurso                                            : Int
    var numberOfTheGame                                     : Int
    var data_sorteio                                        : String
    var bola_um                                             : Int
    var bola_dois                                           : Int
    var bola_tres                                           : Int
    var bola_quatro                                         : Int
    var bola_cinco                                          : Int
    var bola_seis                                           : Int
    var bola_sete                                           : Int
    var bola_oito                                           : Int
    var bola_nove                                           : Int
    var bola_dez                                            : Int
    var bola_onze                                           : Int
    var bola_doze                                           : Int
    var bola_treze                                          : Int
    var bola_catorze                                        : Int
    var bola_quinze                                         : Int
    var bola_dezesseis                                      : Int
    var bola_dezessete                                      : Int
    var bola_dezoito                                        : Int
    var bola_dezenove                                       : Int
    var bola_vinte                                          : Int
    var all_numbers                                         : [Int]
    var all_Numbers_str                                     : String
    var arrecadacao_total                                   : String
    var ganhadores_vinte_numeros                            : Int
    var cidade                                              : String
    var uf                                                  : String
    var ganhadores_dezenove_numeros                         : Int
    var ganhadores_dezoito_numeros                          : Int
    var ganhadores_dezessete_numeros                        : Int
    var ganhadores_dezesseis_numeros                        : Int
    var ganhadores_nenhum_numero                            : Int
    var valor_rateio_vinte_numeros                          : String
    var valor_rateio_dezenove_numeros                       : String
    var valor_rateio_dezoito_numeros                        : String
    var valor_rateio_dezessete_numeros                      : String
    var valor_rateio_dezesseis_numeros                      : String
    var valor_rateio_nenhum_numero                          : String
    var acumulado_vinte_numeros                             : String
    var acumulado_dezenove_numeros                          : String
    var acumulado_dezoito_numeros                           : String
    var acumulado_dezessete_numeros                         : String
    var acumulado_dezesseis_numeros                         : String
    var acumulado_nenhum_numero                             : String
    var estimativa_premio                                   : String
    var valor_acumulado_especial                            : String
    
    
    
    init(id                                                 : Int,
         concurso                                           : Int,
         numberOfTheGame                                    : Int,
         data_sorteio                                       : String,
         bola_um                                             : Int,
         bola_dois                                           : Int,
         bola_tres                                           : Int,
         bola_quatro                                         : Int,
         bola_cinco                                          : Int,
         bola_seis                                           : Int,
         bola_sete                                           : Int,
         bola_oito                                           : Int,
         bola_nove                                           : Int,
         bola_dez                                            : Int,
         bola_onze                                           : Int,
         bola_doze                                           : Int,
         bola_treze                                          : Int,
         bola_catorze                                        : Int,
         bola_quinze                                         : Int,
         bola_dezesseis                                      : Int,
         bola_dezessete                                      : Int,
         bola_dezoito                                        : Int,
         bola_dezenove                                       : Int,
         bola_vinte                                          : Int,
         all_numbers                                         : [Int],
         all_Numbers_str                                     : String,
         arrecadacao_total                                   : String,
         ganhadores_vinte_numeros                            : Int,
         cidade                                              : String,
         uf                                                  : String,
         ganhadores_dezenove_numeros                         : Int,
         ganhadores_dezoito_numeros                          : Int,
         ganhadores_dezessete_numeros                        : Int,
         ganhadores_dezesseis_numeros                        : Int,
         ganhadores_nenhum_numero                            : Int,
         valor_rateio_vinte_numeros                          : String,
         valor_rateio_dezenove_numeros                       : String,
         valor_rateio_dezoito_numeros                        : String,
         valor_rateio_dezessete_numeros                      : String,
         valor_rateio_dezesseis_numeros                      : String,
         valor_rateio_nenhum_numero                          : String,
         acumulado_vinte_numeros                             : String,
         acumulado_dezenove_numeros                          : String,
         acumulado_dezoito_numeros                           : String,
         acumulado_dezessete_numeros                         : String,
         acumulado_dezesseis_numeros                         : String,
         acumulado_nenhum_numero                             : String,
         estimativa_premio                                   : String,
         valor_acumulado_especial                            : String

        ) {

        self.id                               = id
        self.concurso                         = concurso
        self.numberOfTheGame                  = numberOfTheGame
        self.data_sorteio                     = data_sorteio
        self.bola_um                          = bola_um
        self.bola_dois                        = bola_dois
        self.bola_tres                        = bola_tres
        self.bola_quatro                      = bola_quatro
        self.bola_cinco                       = bola_cinco
        self.bola_seis                        = bola_seis
        self.bola_sete                        = bola_sete
        self.bola_oito                        = bola_oito
        self.bola_nove                        = bola_nove
        self.bola_dez                         = bola_dez
        self.bola_onze                        = bola_onze
        self.bola_doze                        = bola_doze
        self.bola_treze                       = bola_treze
        self.bola_catorze                     = bola_catorze
        self.bola_quinze                      = bola_quinze
        self.bola_dezesseis                   = bola_dezesseis
        self.bola_dezessete                   = bola_dezessete
        self.bola_dezoito                     = bola_dezoito
        self.bola_dezenove                    = bola_dezenove
        self.bola_vinte                       = bola_vinte
        self.all_numbers                      = all_numbers
        self.all_Numbers_str                  = all_Numbers_str
        self.arrecadacao_total                = arrecadacao_total
        self.ganhadores_vinte_numeros         = ganhadores_vinte_numeros
        self.cidade                           = cidade
        self.uf                               = uf
        self.ganhadores_dezenove_numeros      = ganhadores_dezenove_numeros
        self.ganhadores_dezoito_numeros       = ganhadores_dezoito_numeros
        self.ganhadores_dezessete_numeros     = ganhadores_dezessete_numeros
        self.ganhadores_dezesseis_numeros     = ganhadores_dezesseis_numeros
        self.ganhadores_nenhum_numero         = ganhadores_nenhum_numero
        self.valor_rateio_vinte_numeros       = valor_rateio_vinte_numeros
        self.valor_rateio_dezenove_numeros    = valor_rateio_dezenove_numeros
        self.valor_rateio_dezoito_numeros     = valor_rateio_dezoito_numeros
        self.valor_rateio_dezessete_numeros   = valor_rateio_dezessete_numeros
        self.valor_rateio_dezesseis_numeros   = valor_rateio_dezesseis_numeros
        self.valor_rateio_nenhum_numero       = valor_rateio_nenhum_numero
        self.acumulado_vinte_numeros          = acumulado_vinte_numeros
        self.acumulado_dezenove_numeros       = acumulado_dezenove_numeros
        self.acumulado_dezoito_numeros        = acumulado_dezoito_numeros
        self.acumulado_dezessete_numeros      = acumulado_dezessete_numeros
        self.acumulado_dezesseis_numeros      = acumulado_dezesseis_numeros
        self.acumulado_nenhum_numero          = acumulado_nenhum_numero
        self.estimativa_premio                = estimativa_premio
        self.valor_acumulado_especial         = valor_acumulado_especial
    }
}

extension LotoMania: PostgreSQLModel {}
extension LotoMania: Migration {}
extension LotoMania: Content {}
extension LotoMania: Parameter {}

