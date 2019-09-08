//
//  Analytics.swift
//  App
//
//  Created by Gabriel Soria Souza on 08/09/19.
//

import Vapor
import FluentPostgreSQL

final class NewAnalytics: Codable {
    var id: Int?
    var date: String
    var view: String
    var lottery: String
    var session: Int
    
    init(date: String, view: String, lottery: String, session: Int) {
        self.date = date
        self.view = view
        self.lottery = lottery
        self.session = session
    }
}

extension NewAnalytics: PostgreSQLModel {}
extension NewAnalytics: Migration {}
extension NewAnalytics: Content {}
extension NewAnalytics: Parameter {}

