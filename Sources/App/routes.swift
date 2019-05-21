import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    let megaSenaController = MegaSenaController()
    try router.register(collection: megaSenaController)
    
    let quinaController = QuinaController()
    try router.register(collection: quinaController)
    
    let lotofacilController = LotoFacilController()
    try router.register(collection: lotofacilController)
    
    let lotomaniaController = LotoManiaController()
    try router.register(collection: lotomaniaController)
    
    let duplasenaController = DuplaSenaController()
    try router.register(collection: duplasenaController)
    
    let timemaniaController = TimeManiaController()
    try router.register(collection: timemaniaController)
    
    let megaSenaStatisticsController = MegaSenaStatisticsController()
    try router.register(collection: megaSenaStatisticsController)
    
    let quinaStatisticsController = QuinaStatisticsController()
    try router.register(collection: quinaStatisticsController)
    
    let lotofacilStatisticsController = LotoFacilStatisticsController()
    try router.register(collection: lotofacilStatisticsController)
    
    let lotomaniaStatisticsController = LotoManiaStatisticsController()
    try router.register(collection: lotomaniaStatisticsController)
    
    let duplasenaStatisticsController = DuplaSenaStatisticsController()
    try router.register(collection: duplasenaStatisticsController)
    
    let timemaniaStatisticsController = TimeManiaStatisticsController()
    try router.register(collection: timemaniaStatisticsController)
    
    let diadesorteStatisticsController = DiaDeSorteStatisticsController()
    try router.register(collection: diadesorteStatisticsController)
    
    let analyticsController = AnalyticsController()
    try router.register(collection: analyticsController)
    
    
}
