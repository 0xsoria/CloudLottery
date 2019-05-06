//
//  Analytics.swift
//  App
//
//  Created by Gabriel Soria Souza on 05/05/19.
//

import Vapor
import FluentPostgreSQL

final class MyAnalytics: Codable {
    var id: Int?
    var event: String
    var date: String
    
    init(event: String, date: String) {
        self.event = event
        self.date = date
    }
}

extension MyAnalytics: PostgreSQLModel {}
extension MyAnalytics: Migration {}
extension MyAnalytics: Content {}
extension MyAnalytics: Parameter {}
