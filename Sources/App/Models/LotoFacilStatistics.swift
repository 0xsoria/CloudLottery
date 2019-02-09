import Vapor
import FluentPostgreSQL

final class LotoFacilStatistics: Codable {
    var id: Int?
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    var eight: Int
    var nine: Int
    var tem: Int
    var eleven: Int
    var twelve: Int
    var thirteen: Int
    var fourteen: Int
    var fifteen: Int
    var sixteen: Int
    var seventeen: Int
    var eighteen: Int
    var nineeen: Int
    var twenty: Int
    var twenty_one: Int
    var twenty_two: Int
    var twenty_three: Int
    var twenty_four: Int
    var twenty_five: Int
    
    
    init(one: Int, two: Int, three: Int, four: Int, five: Int, six: Int, seven: Int, eight: Int, nine: Int, tem: Int, eleven: Int, twelve: Int, thirteen: Int, fourteen: Int, fifteen: Int, sixteen: Int, seventeen: Int, eighteen: Int, nineeen: Int, twenty: Int, twenty_one: Int, twenty_two: Int, twenty_three: Int, twenty_four: Int, twenty_five: Int) {
        
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
        self.eight = eight
        self.nine = nine
        self.tem = tem
        self.eleven = eleven
        self.twelve = twelve
        self.thirteen = thirteen
        self.fourteen = fourteen
        self.fifteen = fifteen
        self.sixteen = sixteen
        self.seventeen = seventeen
        self.eighteen = eighteen
        self.nineeen = nineeen
        self.twenty = twenty
        self.twenty_one = twenty_one
        self.twenty_two = twenty_two
        self.twenty_three = twenty_three
        self.twenty_four = twenty_four
        self.twenty_five = twenty_five
    }
    
}

extension LotoFacilStatistics: PostgreSQLModel {}
extension LotoFacilStatistics: Migration {}
extension LotoFacilStatistics: Content {}
extension LotoFacilStatistics: Parameter {}