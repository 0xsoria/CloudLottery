import Vapor
import FluentPostgreSQL

final class QuinaStatistics: Codable {
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
    var fifty_one: Int
    var fifty_two: Int
    var fifty_three: Int
    var fifty_four: Int
    var fifty_five: Int
    var fifty_six: Int
    var fifty_seven: Int
    var fifty_eight: Int
    var fifty_nine: Int
    var sixty: Int
    var sixty_one: Int
    var sixty_two: Int
    var sixty_three: Int
    var sixty_four: Int
    var sixty_five: Int
    var sixty_six: Int
    var sixty_seven: Int
    var sixty_eight: Int
    var sixty_nine: Int
    var seventy: Int
    var seventy_one: Int
    var seventy_two: Int
    var seventy_three: Int
    var seventy_four: Int
    var seventy_five: Int
    var seventy_six: Int
    var seventy_seven: Int
    var seventy_eight: Int
    var seventy_nine: Int
    var eighty: Int
    
    
    init(one: Int, two: Int, three: Int, four: Int, five: Int, six: Int, seven: Int, eight: Int, nine: Int, tem: Int, eleven: Int, twelve: Int, thirteen: Int, fourteen: Int, fifteen: Int, sixteen: Int, seventeen: Int, eighteen: Int, nineeen: Int, twenty: Int, twenty_one: Int, twenty_two: Int, twenty_three: Int, twenty_four: Int, twenty_five: Int, twenty_six: Int, twenty_seven: Int, twenty_eight: Int, twenty_nine: Int, thirdy: Int, thirdy_one: Int, thirdy_two: Int, thirdy_three: Int, thirdy_four: Int, thirdy_five: Int, thirdy_six: Int, thirdy_seven: Int, thirdy_eight: Int, thirdy_nine: Int, forty: Int, forty_one: Int, forty_two: Int, forty_three: Int, forty_four: Int, forty_five: Int, forty_six: Int, forty_seven: Int, forty_eight: Int, forty_nine: Int, fifty: Int, fifty_one: Int, fifty_two: Int, fifty_three: Int, fifty_four: Int, fifty_five: Int, fifty_six: Int, fifty_seven: Int, fifty_eight: Int, fifty_nine: Int, sixty: Int, sixty_one: Int, sixty_two: Int, sixty_three: Int, sixty_four: Int, sixty_five: Int, sixty_six: Int, sixty_seven: Int, sixty_eight: Int, sixty_nine: Int, seventy: Int, seventy_one: Int, seventy_two: Int, seventy_three: Int, seventy_four: Int, seventy_five: Int, seventy_six: Int, seventy_seven: Int, seventy_eight: Int, seventy_nine: Int, eighty: Int) {
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
        self.twenty_six = twenty_six
        self.twenty_seven = twenty_seven
        self.twenty_eight = twenty_eight
        self.twenty_nine = twenty_nine
        self.thirdy = thirdy
        self.thirdy_one = thirdy_one
        self.thirdy_two = thirdy_two
        self.thirdy_three = thirdy_three
        self.thirdy_four = thirdy_four
        self.thirdy_five = thirdy_five
        self.thirdy_six = thirdy_six
        self.thirdy_seven = thirdy_seven
        self.thirdy_eight = thirdy_eight
        self.thirdy_nine = thirdy_nine
        self.forty = forty
        self.forty_one = forty_one
        self.forty_two = forty_two
        self.forty_three = forty_three
        self.forty_four = forty_four
        self.forty_five = forty_five
        self.forty_six = forty_six
        self.forty_seven = forty_seven
        self.forty_eight = forty_eight
        self.forty_nine = forty_nine
        self.fifty = fifty
        self.fifty_one = fifty_one
        self.fifty_two = fifty_two
        self.fifty_three = fifty_three
        self.fifty_four = fifty_four
        self.fifty_five = fifty_five
        self.fifty_six = fifty_six
        self.fifty_seven = fifty_seven
        self.fifty_eight = fifty_eight
        self.fifty_nine = fifty_nine
        self.sixty = sixty
        self.sixty_one = sixty_one
        self.sixty_two = sixty_two
        self.sixty_three = sixty_three
        self.sixty_four = sixty_four
        self.sixty_five = sixty_five
        self.sixty_six = sixty_six
        self.sixty_seven = sixty_seven
        self.sixty_eight = sixty_eight
        self.sixty_nine = sixty_nine
        self.seventy = seventy
        self.seventy_one = seventy_one
        self.seventy_two = seventy_two
        self.seventy_three = seventy_three
        self.seventy_four = seventy_four
        self.seventy_five = seventy_five
        self.seventy_six = seventy_six
        self.seventy_seven = seventy_seven
        self.seventy_eight = seventy_eight
        self.seventy_nine = seventy_nine
        self.eighty = eighty
    }
    
}

extension QuinaStatistics: PostgreSQLModel {}
extension QuinaStatistics: Migration {}
extension QuinaStatistics: Content {}
extension QuinaStatistics: Parameter {}
