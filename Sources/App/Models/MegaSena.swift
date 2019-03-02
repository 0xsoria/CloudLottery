//
//  MegaSenaPastGame.swift
//  App
//
//  Created by Gabriel Soria Souza on 02/02/19.
//

import Vapor
import FluentPostgreSQL

final class MegaSena: Codable {
    var id: Int?
    var numberOfTheGame: Int
    var data_sorteio: String
    var dezena_um: Int
    var dezena_dois: Int
    var dezena_tres: Int
    var dezena_quatro: Int
    var dezena_cinco: Int
    var dezena_seis: Int
    var all_numbers: [Int]
    var arrecadacao_total: String
    var ganhadores_sena: Int
    var cidade: String
    var uf: String
    var rateio_sena: String
    var ganhadores_quina: Int
    var rateio_quina: String
    var ganhadores_quadra: Int
    var rateio_quadra: String
    var acumulado: String
    var valor_acumulado: String
    var estimativa_premio: String
    var acumulado_mega_da_virada: String
    var allNumbersString: String {
        get {
            let sortedNumbers = all_numbers.sorted()
            var stringAllNumbers = String()
            for i in sortedNumbers {
                if stringAllNumbers.isEmpty {
                    stringAllNumbers.append(String(i))
                } else {
                    stringAllNumbers.append("-\(i)")
                }
            }
            return stringAllNumbers
        }
        set {
            print(newValue)
        }
    }
    
    init(id: Int, numberOfTheGame: Int, data_sorteio: String, dezena_um: Int, dezena_dois: Int, dezena_tres: Int, dezena_quatro: Int, dezena_cinco: Int, dezena_seis: Int, all_numbers: [Int], arrecadacao_total: String, ganhadores_sena: Int, cidade: String, uf: String, rateio_sena: String, ganhadores_quina: Int, rateio_quina: String, ganhadores_quadra: Int, rateio_quadra: String, acumulado: String, valor_acumulado: String, estimativa_premio: String, acumulado_mega_da_virada: String) {
        self.id = id
        self.numberOfTheGame = numberOfTheGame
        self.data_sorteio = data_sorteio
        self.dezena_um = dezena_um
        self.dezena_dois = dezena_dois
        self.dezena_tres = dezena_tres
        self.dezena_quatro = dezena_quatro
        self.dezena_cinco = dezena_cinco
        self.dezena_seis = dezena_seis
        self.all_numbers = all_numbers
        self.arrecadacao_total = arrecadacao_total
        self.ganhadores_sena = ganhadores_sena
        self.cidade = cidade
        self.uf = uf
        self.rateio_sena = rateio_sena
        self.ganhadores_quina = ganhadores_quina
        self.rateio_quina = rateio_quina
        self.ganhadores_quadra = ganhadores_quadra
        self.rateio_quadra = rateio_quadra
        self.acumulado = acumulado
        self.valor_acumulado = valor_acumulado
        self.estimativa_premio = estimativa_premio
        self.acumulado_mega_da_virada = acumulado_mega_da_virada
    }
}

extension MegaSena: PostgreSQLModel {}
extension MegaSena: Migration {}
extension MegaSena: Content {}
extension MegaSena: Parameter {}
