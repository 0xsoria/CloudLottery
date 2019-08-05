//
//  LotoFacilNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 16/12/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotoFacilConcourseData: Codable {
    let concurso: LotoFacilConcourseReturn
    let proximo_concurso: NextConcourseShared
    let especial_independencia_valor_acumulado: String
    let resultado_completo: String
    
    init(concurso: LotoFacilConcourseReturn, proximo_concurso: NextConcourseShared, especial_independencia_valor_acumulado: String, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.especial_independencia_valor_acumulado = especial_independencia_valor_acumulado
        self.resultado_completo = resultado_completo
    }
}

struct LotoFacilConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas: [String]
    let premiacao: PrizeReturnLotoFacil
    let arrecadacao_total: String
}

struct PrizeReturnLotoFacil: Codable {
    let acertos_15: Acertos15
    let acertos_14: Acertos14
    let acertos_13: Acertos13
    let acertos_12: Acertos12
    let acertos_11: Acertos11
}

struct Acertos15: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos14: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos13: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos12: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos11: Codable {
    let ganhadores: String
    let valor_pago: String
}
