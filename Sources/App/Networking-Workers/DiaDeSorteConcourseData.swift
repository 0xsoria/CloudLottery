//
//  DiaDeSorteNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/05/19.
//  Copyright © 2019 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct DiaDeSorteConcourseData: Codable {
    let concurso: DiaDeSorteReturnData
    let proximo_concurso: NextConcourseShared
    let resultado_completo: String
    
    init(concurso: DiaDeSorteReturnData, proximo_concurso: NextConcourseShared, resultado_completo: String) {
        self.concurso = concurso
        self.proximo_concurso = proximo_concurso
        self.resultado_completo = resultado_completo
    }
}

struct DiaDeSorteReturnData: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let valor_acumulado: String
    let dezenas: [String]
    let mes: String
    let premiacao: DiaDeSortePrize
    let arrecadacao_total: String
}

struct DiaDeSortePrize: Codable {
    let acertos_7: MesDeSorteAcertosSete
    let acertos_6: MesDeSorteAcertosSeis
    let acertos_5: MesDeSorteAcertosCinco
    let acertos_4: MesDeSorteAcertosQuatro
    let mes_sorte: MesDeSorte
}

struct MesDeSorte: Codable {
    let ganhadores: String
    let valor_pago: String
    let mes: String
}

struct MesDeSorteAcertosSete: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct MesDeSorteAcertosSeis: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct MesDeSorteAcertosCinco: Codable {
    let ganhadores: String
    let valor_pago: String
}

struct MesDeSorteAcertosQuatro: Codable {
    let ganhadores: String
    let valor_pago: String
}

