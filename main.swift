//
//  main.swift
//  LearnSwift4
//
//  Created by Jason on 2017/10/18.
//  Copyright © 2017年 Jason. All rights reserved.
//

import Foundation

print("Hello, World!")

func makeincrementer() -> (Int) -> Int {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
let increment = makeincrementer()
print(increment(7))

func hasAnyMatchs(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12];
print(hasAnyMatchs(list: numbers, condition: lessThanTen))
print(numbers.map { (number: Int) -> String in
    let result  = 2 * number
    return String(result)
})
print(numbers)

let mappedNumbers = numbers.map({ number in
    3*number
})
print(mappedNumbers)
let sortedNumbers = numbers.sorted {$0 > $1}
print(sortedNumbers)

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    case smallcat, bigcat
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        case .smallcat:
            return "small cat"
        case .bigcat:
            return "big cat"
        default:
            return String(self.rawValue)
        }
    }
    
    func compared(rank1: Rank, rank2: Rank) -> Bool {
        return rank1.rawValue == rank2.rawValue
    }
}
let ace = Rank.ace
let aceRowValue = ace.rawValue
ace.compared(rank1: Rank.ace, rank2: Rank.ace)

if let convertRank = Rank(rawValue: 1) {
    let aceDescription = convertRank.simpleDescription()
    print(aceDescription)
}

enum Suite {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let heartss: Suite = .hearts
heartss.simpleDescription()
let hearts = Suite.hearts
hearts.simpleDescription()
hearts.color()

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case nothing
    
    func simpleDescription() -> String {
        switch self {
        case let .result(sunrise, sunset):
            return "Sunrise is at \(sunrise) and sunset is at\(sunset)"
        case let .failure(message):
            return "Failure:.. \(message)"
        case .nothing:
            return "nothing.."
        }
    }
}
let success = ServerResponse.result("6:0 am", "8:0 pm")
let failure = ServerResponse.failure("Out of cheese.")
let nop     = ServerResponse.nothing
success.simpleDescription()
failure.simpleDescription()
nop.simpleDescription()

struct Card {
    var rank: Rank
    var suit: Suite
    
    func wholeCards() -> [Card] {
        var cards = [Card]()
        cards.append(contentsOf: self.rankOfAllSuit(rank: .ace))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .two))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .three))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .four))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .five))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .six))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .seven))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .eight))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .nine))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .ten))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .jack))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .queen))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .king))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .smallcat))
        cards.append(contentsOf: self.rankOfAllSuit(rank: .bigcat))
        return cards
    }
    
    func rankOfAllSuit(rank: Rank) -> [Card] {
        switch rank {
        case .ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king:
            return [
                Card(rank: rank, suit: .spades),
                Card(rank: rank, suit: .hearts),
                Card(rank: rank, suit: .diamonds),
                Card(rank: rank, suit: .clubs),
            ]
        case .smallcat, .bigcat:
            return [
                Card(rank: rank, suit: .clubs)
            ]
            
        }
    }
    
    func simpleDecription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDecription()
let cards = threeOfSpades.wholeCards()
print(cards)

extension Double {
    var absoluteValue: Double {
        return fabs(self)
    }
}
print((-4.2).absoluteValue)


enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    } 
    return "Job sent"
}
//send(job: 1, toPrinter: "Never Has Toner")
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner..")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1110, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I`ll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//defer
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    print("hello")
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
    func simpleDescription() -> Any {
        switch self {
        case .none:
            return self
        case let .some(val):
            return val
        }
    }
}
var possibleInteger: OptionalValue<Int> = .none
print(possibleInteger.simpleDescription())
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U:Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> T where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var result: T = lhs
    for lhsItem in lhs {
        if rhs.contains(lhsItem) {
            result = lhs
        }
    }
    return result
}

