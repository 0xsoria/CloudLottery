//
//  LotoManiaNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/05/19.
//  Copyright © 2019 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotoManiaConcourseData: Codable {
    let concurso: LotoManiaConcourseReturn
    let proximo_concurso: NextConcourseShared
    let resultado_completo: String
    
    init(concurso: LotoManiaConcourseReturn, proximo_concurso: NextConcourseShared, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.resultado_completo = resultado_completo
    }
}

struct LotoManiaConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas: [String]
    let premiacao: LotoManiaPrize
    let arrecadacao_total: String
}

struct LotoManiaPrize: Codable {
    let acertos_20: Acertos20LM
    let acertos_19: Acertos19LM
    let acertos_18: Acertos18LM
    let acertos_17: Acertos17LM
    let acertos_16: Acertos16LM
    let acertos_15: Acertos15LM
    let acertos_0: Acertos0LM
}

struct Acertos20LM: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos19LM: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos18LM: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos17LM: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos16LM: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos15LM: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct Acertos0LM: Codable {
    let ganhadores: String
    let valor_pago: String
}
