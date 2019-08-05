//
//  MegaSenaNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 16/12/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct SenaConcourseData: Codable {
    let concurso: LotteryConcourseReturn
    let proximo_concurso: NextConcourseShared
    let valor_acumulado_final_cinco: String
    let valor_acumulado_final_zero: String
    let mega_virada_valor_acumulado: String
    let resultado_completo: String
    
    init(concurso: LotteryConcourseReturn, proximo_concurso: NextConcourseShared, valor_acumulado_final_cinco: String, valor_acumulado_final_zero: String, mega_virada_valor_acumulado: String, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.valor_acumulado_final_cinco = valor_acumulado_final_cinco
        self.valor_acumulado_final_zero = valor_acumulado_final_zero
        self.mega_virada_valor_acumulado = mega_virada_valor_acumulado
        self.resultado_completo = resultado_completo
    }
}

struct LotteryConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas: [String]
    let premiacao: Prize
    let arrecadacao_total: String
}

struct Prize: Codable {
    let sena: PrizeSena
    let quina: PrizeQuina
    let quadra: PrizeQuadra
}

struct PrizeSena: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct PrizeQuina: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct PrizeQuadra: Codable {
    let ganhadores: String
    let valor_pago: String
}

public struct NextConcourseShared: Codable {
    let data: String
    let valor_estimado: String
}
