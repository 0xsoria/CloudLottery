//
//  FederalNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/05/19.
//  Copyright © 2019 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct FederalConcourseData: Codable {
    let concurso: FederalConcourseReturn
    
    init(concurso: FederalConcourseReturn) {
        self.concurso = concurso
    }
}

struct FederalConcourseReturn: Codable {
    let numero: String
    let data: String
    let cidade: String
    let local: String
    let premiacao: FederalPrize
    let cidade_1_premio: String
    let resultado_completo: String
}

public struct FederalPrize: Codable {
    let premio_1: FederalPrizeDetail
    let premio_2: FederalPrizeDetail
    let premio_3: FederalPrizeDetail
    let premio_4: FederalPrizeDetail
    let premio_5: FederalPrizeDetail
}

struct FederalPrizeDetail: Codable {
    let bilhete: String
    let valor_pago: String
}

extension FederalPrize: Equatable {
    public static func == (lhs: FederalPrize, rhs: FederalPrize) -> Bool {
        return lhs.premio_1 == rhs.premio_1 &&
        lhs.premio_2 == rhs.premio_2 &&
        lhs.premio_3 == rhs.premio_3 &&
        lhs.premio_4 ==  rhs.premio_4 &&
        lhs.premio_5 == rhs.premio_5
    }
}

extension FederalPrizeDetail: Equatable {
    
}
