//
//  LotteryNetworkingWorker.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 16/12/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotteryNetworkingWorker {
    let lotteryGameString: String
    let lotteryGame: LotteryGames
    let lotteryGameNoSpace: LotteryGamesNoSpace
    let concourseNumber: String
    let numbers: [String]
    let date: String
    let accumulatedValue: String
    let prize: String
    let winners: String
    let duplaSenaSecondSetOfNumbers: [String]?
    let teamOrDay: String?
    let duplaSenaTeamOrDayPrize: String?
    let duplaSenaTeamOrDayWinners: String?
    let federalPrize: FederalPrize?
    
    init(lotteryGameString: String, lotteryGame: LotteryGames, lotteryGameNoSpace: LotteryGamesNoSpace, concourseNumber: String, numbers: [String], date: String, accumulatedValue: String, prize: String, winners: String, duplaSenaSecondSetOfNumbers: [String]?, teamOrDay: String?, duplaSenaTeamOrDayPrize: String?, duplaSenaTeamOrDayWinners: String?, federalPrize: FederalPrize?) {
        self.lotteryGameString = lotteryGameString
        self.lotteryGame = lotteryGame
        self.lotteryGameNoSpace = lotteryGameNoSpace
        self.concourseNumber = concourseNumber
        self.numbers = numbers
        self.date = date
        self.accumulatedValue = accumulatedValue
        self.prize = prize
        self.winners = winners
        self.duplaSenaSecondSetOfNumbers = duplaSenaSecondSetOfNumbers
        self.teamOrDay = teamOrDay
        self.duplaSenaTeamOrDayPrize = duplaSenaTeamOrDayPrize
        self.duplaSenaTeamOrDayWinners = duplaSenaTeamOrDayWinners
        self.federalPrize = federalPrize
    }
}

extension LotteryNetworkingWorker: Equatable {
    static func == (lhs: LotteryNetworkingWorker, rhs: LotteryNetworkingWorker) -> Bool {
        return lhs.lotteryGameString == rhs.lotteryGameString   &&
        lhs.lotteryGame == rhs.lotteryGame &&
        lhs.lotteryGameNoSpace == rhs.lotteryGameNoSpace &&
        lhs.concourseNumber == rhs.concourseNumber &&
        lhs.numbers == rhs.numbers &&
        lhs.date == rhs.date &&
        lhs.accumulatedValue == rhs.accumulatedValue &&
        lhs.prize == rhs.prize &&
        lhs.winners == rhs.winners &&
        lhs.duplaSenaSecondSetOfNumbers == rhs.duplaSenaSecondSetOfNumbers &&
        lhs.teamOrDay == rhs.teamOrDay &&
        lhs.duplaSenaTeamOrDayPrize == rhs.duplaSenaTeamOrDayPrize &&
        lhs.duplaSenaTeamOrDayWinners == rhs.duplaSenaTeamOrDayWinners 
        //lhs.federalPrize == rhs.federalPrize
    }
    
    
}
