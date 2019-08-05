//
//  QuinaNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 16/12/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct QuinaConcourseData: Codable {
    let concurso: QuinaConcourseReturn
    let proximo_concurso: NextConcourseShared
    let especial_sao_joao_valor_acumulado: String
    let resultado_completo: String
    
    init(concurso: QuinaConcourseReturn, proximo_concurso: NextConcourseShared, especial_sao_joao_valor_acumulado: String, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.especial_sao_joao_valor_acumulado = especial_sao_joao_valor_acumulado
        self.resultado_completo = resultado_completo
    }
}

struct QuinaConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas: [String]
    let premiacao: PrizeReturnQuina
    let arrecadacao_total: String
}

struct PrizeReturnQuina: Codable {
    let quina: QuinaPrizeReturn
    let quadra: QuadraPrizeReturn
    let terno: TernoPrizeReturn
    let duque: DuquePrizeReturn
}

struct QuinaPrizeReturn: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct QuadraPrizeReturn: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct TernoPrizeReturn: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct DuquePrizeReturn: Codable {
    let ganhadores: String
    let valor_pago: String
}

