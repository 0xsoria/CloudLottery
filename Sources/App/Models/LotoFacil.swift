//
//  MegaSenaPastGame.swift
//  App
//
//  Created by Gabriel Soria Souza on 02/03/19.
//

import Vapor
import FluentPostgreSQL

final class LotoFacil: Codable {
    var id: Int?
    var numberOfTheGame: Int
    var data_sorteio: String
    var bola_um: Int
    var bola_dois: Int
    var bola_tres: Int
    var bola_quatro: Int
    var bola_cinco: Int
    var bola_seis: Int
    var bola_sete: Int
    var bola_oito: Int
    var bola_nove: Int
    var bola_dez: Int
    var bola_onze: Int
    var bola_doze: Int
    var bola_treze: Int
    var bola_catorze: Int
    var bola_quinze: Int
    var all_numbers: [Int]
    var all_numbers_str: String
    var arrecadacao_total: String
    var ganhadores_quinze_numeros: Int
    var cidade: String
    var uf: String
    var ganhadores_catorze_numeros: Int
    var ganhadores_treze_numeros: Int
    var ganhadores_doze_numeros: Int
    var ganhadores_onze_numeros: Int
    var valor_rateio_quinze_numeros: String
    var valor_rateio_catorze_numeros: String
    var valor_rateio_treze_numeros: String
    var valor_rateio_doze_numeros: String
    var valor_rateio_onze_numeros: String
    var acumulado_quinze_numeros: String
    var estimativa_premio: String
    var valor_acumulado_especial: String

    init(id: Int, numberOfTheGame: Int, data_sorteio: String, bola_um: Int, bola_dois: Int, bola_tres: Int, bola_quatro: Int, bola_cinco: Int, bola_seis: Int, bola_sete: Int, bola_oito: Int, bola_nove: Int, bola_dez: Int, bola_onze: Int, bola_doze: Int, bola_treze: Int, bola_catorze: Int, bola_quinze: Int, all_numbers: [Int], all_numbers_str: String, arrecadacao_total: String, ganhadores_quinze_numeros: Int, cidade: String, uf: String, ganhadores_catorze_numeros: Int, ganhadores_treze_numeros: Int, ganhadores_doze_numeros: Int, ganhadores_onze_numeros: Int, valor_rateio_quinze_numeros: String, valor_rateio_catorze_numeros: String, valor_rateio_treze_numeros: String, valor_rateio_doze_numeros: String, valor_rateio_onze_numeros: String, acumulado_quinze_numeros: String, estimativa_premio: String, valor_acumulado_especial: String) {
        
        self.id                                     = id
        self.numberOfTheGame                        = numberOfTheGame
        self.data_sorteio                           = data_sorteio
        self.bola_um                                = bola_um
        self.bola_dois                              = bola_dois
        self.bola_tres                              = bola_tres
        self.bola_quatro                            = bola_quatro
        self.bola_cinco                             = bola_cinco
        self.bola_seis                              = bola_seis
        self.bola_sete                              = bola_sete
        self.bola_oito                              = bola_oito
        self.bola_nove                              = bola_nove
        self.bola_dez                               = bola_dez
        self.bola_onze                              = bola_onze
        self.bola_doze                              = bola_doze
        self.bola_treze                             = bola_treze
        self.bola_catorze                           = bola_catorze
        self.bola_quinze                            = bola_quinze
        self.all_numbers                            = all_numbers
        self.all_numbers_str                        = all_numbers_str
        self.arrecadacao_total                      = arrecadacao_total
        self.ganhadores_quinze_numeros              = ganhadores_quinze_numeros
        self.cidade                                 = cidade
        self.uf                                     = uf
        self.ganhadores_catorze_numeros             = ganhadores_catorze_numeros
        self.ganhadores_treze_numeros               = ganhadores_treze_numeros
        self.ganhadores_doze_numeros                = ganhadores_doze_numeros
        self.ganhadores_onze_numeros                = ganhadores_onze_numeros
        self.valor_rateio_quinze_numeros            = valor_rateio_quinze_numeros
        self.valor_rateio_catorze_numeros           = valor_rateio_catorze_numeros
        self.valor_rateio_treze_numeros             = valor_rateio_treze_numeros
        self.valor_rateio_doze_numeros              = valor_rateio_doze_numeros
        self.valor_rateio_onze_numeros              = valor_rateio_onze_numeros
        self.acumulado_quinze_numeros               = acumulado_quinze_numeros
        self.estimativa_premio                      = estimativa_premio
        self.valor_acumulado_especial               = valor_acumulado_especial
    }
}

extension LotoFacil: PostgreSQLModel {}
extension LotoFacil: Migration {}
extension LotoFacil: Content {}
extension LotoFacil: Parameter {}
