//
//  DuplaSenaNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/05/19.
//  Copyright © 2019 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct DuplaSenaConcourseData: Codable {
    let concurso: DuplaSenaConcourseReturn
    let proximo_concurso: NextConcourseShared
    let especial_pascoa_valor_acumulado: String
    let resultado_completo: String
    
    init(concurso: DuplaSenaConcourseReturn, proximo_concurso: NextConcourseShared, especial_pascoa_valor_acumulado: String, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.especial_pascoa_valor_acumulado = especial_pascoa_valor_acumulado
        self.resultado_completo = resultado_completo
    }
}

struct DuplaSenaConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas_1: [String]
    let dezenas_2: [String]
    let premiacao_1: PrizeReturnDuplaSena
    let premiacao_2: PrizeReturnDuplaSena
    let arrecadacao_total: String
    
}

struct PrizeReturnDuplaSena: Codable {
    let sena: PrizeDuplaSena
    let quina: PrizeDuplaQuina
    let quadra: PrizeDuplaQuadra
    let terno: PrizeDuplaTerno
}

struct PrizeDuplaSena: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct PrizeDuplaQuina: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct PrizeDuplaQuadra: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct PrizeDuplaTerno: Codable {
    let ganhadores: String
    let valor_pago: String
}
