//
//  Quina.swift
//  App
//
//  Created by Gabriel Soria Souza on 28/02/19.
//

import Vapor
import FluentPostgreSQL

final class Quina: Codable {
    var id: Int?
    var numberOfTheGame: Int
    var data_sorteio: String
    var dezena_um: Int
    var dezena_dois: Int
    var dezena_tres: Int
    var dezena_quatro: Int
    var dezena_cinco: Int
    var all_numbers: [Int]
    var all_numbers_str: String
    var arrecadacao_total: String
    var ganhadores_quina: Int
    var cidade: String
    var uf: String
    var rateio_quina: String
    var ganhadores_quadra: Int
    var rateio_quadra: String
    var ganhadores_terno: Int
    var rateio_terno: String
    var ganhadores_duque: Int
    var rateio_duque: String
    var acumulado: String
    var valor_acumulado: String
    var estimativa_premio: String
    var valor_acumulado_sorteio_especial_sao_joao: String

    init(id: Int,
         numberOfTheGame: Int,
         data_sorteio: String,
         dezena_um: Int,
         dezena_dois: Int,
         dezena_tres: Int,
         dezena_quatro: Int,
         dezena_cinco: Int,
         all_numbers: [Int],
         all_numbers_str: String,
         arrecadacao_total: String,
         ganhadores_quina: Int,
         cidade: String,
         uf: String,
         rateio_quina: String,
         ganhadores_quadra: Int,
         rateio_quadra: String,
         ganhadores_terno: Int,
         rateio_terno: String,
         ganhadores_duque: Int,
         rateio_duque: String,
         acumulado: String,
         valor_acumulado: String,
         estimativa_premio: String,
         valor_acumulado_sorteio_especial_sao_joao: String) {
        
        self.id = id
        self.numberOfTheGame = numberOfTheGame
        self.data_sorteio = data_sorteio
        self.dezena_um = dezena_um
        self.dezena_dois = dezena_dois
        self.dezena_tres = dezena_tres
        self.dezena_quatro = dezena_quatro
        self.dezena_cinco = dezena_cinco
        self.all_numbers = all_numbers
        self.all_numbers_str = all_numbers_str
        self.arrecadacao_total = arrecadacao_total
        self.ganhadores_quina = ganhadores_quina
        self.cidade = cidade
        self.uf = uf
        self.rateio_quina = rateio_quina
        self.ganhadores_quadra = ganhadores_quadra
        self.rateio_quadra = rateio_quadra
        self.ganhadores_terno = ganhadores_terno
        self.rateio_terno = rateio_terno
        self.ganhadores_duque = ganhadores_duque
        self.rateio_duque = rateio_duque
        self.acumulado = acumulado
        self.valor_acumulado = valor_acumulado
        self.estimativa_premio = estimativa_premio
        self.valor_acumulado_sorteio_especial_sao_joao = valor_acumulado_sorteio_especial_sao_joao
    }
}

extension Quina: PostgreSQLModel {}
extension Quina: Migration {}
extension Quina: Content {}
extension Quina: Parameter {}
