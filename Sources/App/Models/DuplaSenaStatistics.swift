import Vapor
import FluentPostgreSQL

final class DuplaSenaStatistics: Codable {

    var id                          : Int?
    var one                         : Int
    var two                         : Int
    var three                       : Int
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
    var twenty_six: Int
    var twenty_seven: Int
    var twenty_eight: Int
    var twenty_nine: Int
    var thirdy: Int
    var thirdy_one: Int
    var thirdy_two: Int
    var thirdy_three: Int
    var thirdy_four: Int
    var thirdy_five: Int
    var thirdy_six: Int
    var thirdy_seven: Int
    var thirdy_eight: Int
    var thirdy_nine: Int
    var forty: Int
    var forty_one: Int
    var forty_two: Int
    var forty_three: Int
    var forty_four: Int
    var forty_five: Int
    var forty_six: Int
    var forty_seven: Int
    var forty_eight: Int
    var forty_nine: Int
    var fifty: Int
    
    init(one                            : Int,
         two                            : Int,
         three                          : Int,
         four                           : Int,
         five                           : Int,
         six                            : Int,
         seven                          : Int,
         eight                          : Int,
         nine                           : Int,
         tem                            : Int,
         eleven                         : Int,
         twelve                         : Int,
         thirteen                       : Int,
         fourteen                       : Int,
         fifteen                        : Int,
         sixteen                        : Int,
         seventeen                      : Int,
         eighteen                       : Int,
         nineeen                        : Int,
         twenty                         : Int,
         twenty_one                     : Int,
         twenty_two                     : Int,
         twenty_three                   : Int,
         twenty_four                    : Int,
         twenty_five                    : Int,
         twenty_six                     : Int,
         twenty_seven                   : Int,
         twenty_eight                   : Int,
         twenty_nine                    : Int,
         thirdy                         : Int,
         thirdy_one                     : Int,
         thirdy_two                     : Int,
         thirdy_three                   : Int,
         thirdy_four                    : Int,
         thirdy_five                    : Int,
         thirdy_six                     : Int,
         thirdy_seven                   : Int,
         thirdy_eight                   : Int,
         thirdy_nine                    : Int,
         forty                          : Int,
         forty_one                      : Int,
         forty_two                      : Int,
         forty_three                    : Int,
         forty_four                     : Int,
         forty_five                     : Int,
         forty_six                      : Int,
         forty_seven                    : Int,
         forty_eight                    : Int,
         forty_nine                     : Int,
         fifty                          : Int
        ) {
        self.one                            = one
        self.two                            = two
        self.three                          = three
        self.four                           = four
        self.five                           = five
        self.six                            = six
        self.seven                          = seven
        self.eight                          = eight
        self.nine                           = nine
        self.tem                            = tem
        self.eleven                         = eleven
        self.twelve                         = twelve
        self.thirteen                       = thirteen
        self.fourteen                       = fourteen
        self.fifteen                        = fifteen
        self.sixteen                        = sixteen
        self.seventeen                      = seventeen
        self.eighteen                       = eighteen
        self.nineeen                        = nineeen
        self.twenty                         = twenty
        self.twenty_one                     = twenty_one
        self.twenty_two                     = twenty_two
        self.twenty_three                   = twenty_three
        self.twenty_four                    = twenty_four
        self.twenty_five                    = twenty_five
        self.twenty_six                     = twenty_six
        self.twenty_seven                   = twenty_seven
        self.twenty_eight                   = twenty_eight
        self.twenty_nine                    = twenty_nine
        self.thirdy                         = thirdy
        self.thirdy_one                     = thirdy_one
        self.thirdy_two                     = thirdy_two
        self.thirdy_three                   = thirdy_three
        self.thirdy_four                    = thirdy_four
        self.thirdy_five                    = thirdy_five
        self.thirdy_six                     = thirdy_six
        self.thirdy_seven                   = thirdy_seven
        self.thirdy_eight                   = thirdy_eight
        self.thirdy_nine                    = thirdy_nine
        self.forty                          = forty
        self.forty_one                      = forty_one
        self.forty_two                      = forty_two
        self.forty_three                    = forty_three
        self.forty_four                     = forty_four
        self.forty_five                     = forty_five
        self.forty_six                      = forty_six
        self.forty_seven                    = forty_seven
        self.forty_eight                    = forty_eight
        self.forty_nine                     = forty_nine
        self.fifty                          = fifty
    }
}

extension DuplaSenaStatistics: PostgreSQLModel {}
extension DuplaSenaStatistics: Migration {}
extension DuplaSenaStatistics: Content {}
extension DuplaSenaStatistics: Parameter {}
