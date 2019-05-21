//
//  DiaDeSorte.swift
//  App
//
//  Created by Gabriel Soria Souza on 19/05/19.
//

import Vapor
import FluentPostgreSQL

final class DiaDeSorte: Codable {
    var id: Int?
}


extension DiaDeSorte: PostgreSQLModel {}
extension DiaDeSorte: Migration {}
extension DiaDeSorte: Content {}
extension DiaDeSorte: Parameter {}
