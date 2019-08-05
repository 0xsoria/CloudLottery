//
//  TimeManiaLotteryWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/05/19.
//  Copyright © 2019 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct TimeManiaConcourseData: Codable {
    let concurso: TimeManiaConcourseReturn
    let proximo_concurso: NextConcourseShared
    let resultado_completo: String
    
    init(concurso: TimeManiaConcourseReturn, proximo_concurso: NextConcourseShared, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.resultado_completo = resultado_completo
    }
}

struct TimeManiaConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas: [String]
    let premiacao: TimeManiaPrize
    let time_coracao: TimeCoracao
    let arrecadacao_total: String
}

struct TimeCoracao: Codable {
    let time: String
    let ganhadores: String
    let valor_pago: String
}

struct TimeManiaPrize: Codable {
    let acertos_7: TimeManiaAcertosSete
    let acertos_6: TimeManiaAcertosSeis
    let acertos_5: TimeManiaAcertosCinco
    let acertos_4: TimeManiaAcertosQuatro
    let acertos_3: TimeManiaAcertosTres
}

struct TimeManiaAcertosSete: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct TimeManiaAcertosSeis: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct TimeManiaAcertosCinco: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct TimeManiaAcertosQuatro: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct TimeManiaAcertosTres: Codable {
    let ganhadores: String
    let valor_pago: String
}
