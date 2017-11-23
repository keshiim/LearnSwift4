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

let π = 3.141592653
let 你好 = "你好啊swift"
let 🐂🐶 = "cowdog"

let `let` = "let"
print(`let`)

let greeting = "Guten Tag!"
print(greeting.startIndex)
greeting[greeting.startIndex] //G
greeting[greeting.index(before: greeting.endIndex)] //!
greeting[greeting.index(after: greeting.startIndex)]//u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "zheng"))

func greet(person: String) {
    print("Hello, \(person)!")
}



func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let m = nums.count, n = nums[0].count
    if (m * n != r * c) { return nums }
    var res = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
    for i in 0..<r {
        for j in 0..<c {
            let k = i * c + j
            res[i][j] = nums[k / n][k % n]
        }
    }
    return res
}
func matrixReshape1(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let m = nums.count, n = nums[0].count
    if (m * n != r * c) { return nums }
    var res = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
    for i in 0..<r*c {
        res[i / c][i % c] = nums[i / n][i % n]
    }
    return res
}
print(matrixReshape1([[1, 2], [3, 4]], 1, 4))

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for i in 0..<nums.count {
        map[nums[i]] = i
    }
    var res = [Int]()
    for i in 0..<nums.count {
        let t = target - nums[i]
        if let index = map[t], index != i {
            res.append(i)
            res.append(index)
            break;
        }
    }
    return res
}
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for i in 0..<nums.count {
        if let index = map[target - nums[i]] {
            return [index, i]
        }
        map[nums[i]] = i
    }
    return []
}
print(twoSum1([2, 7, 11, 15], 9))

func shortestDistance(_ words: [String], word1: String, word2: String) -> Int {
    var idx1: [Int] = [Int](), idx2 = [Int]()
    var res = Int.max
    for i in 0..<words.count {
        if words[i] == word1 { idx1.append(i) }
        else if words[i] == word2 { idx2.append(i) }
    }
    for i in 0..<idx1.count {
        for j in 0..<idx2.count {
            res = min(res, abs(idx1[i] - idx2[j]))
        }
    }
    return res
}
print(shortestDistance(["practice", "makes", "perfect", "coding", "makes"], word1: "makes", word2: "coding"))

func shortestDistance1(_ words: [String], word1: String, word2: String) -> Int {
    var idx1: Int = -1, idx2 = -1
    var res = Int.max
    for i in 0..<words.count {
        if words[i] == word1 { idx1 = i}
        else if words[i] == word2 { idx2 = i}
        if idx1 != -1 && idx2 != -1 {
            res = min(res, abs(idx1 - idx2))
        }
    }
    return res
}
print(shortestDistance1(["practice", "makes", "perfect", "coding", "makes"], word1: "coding", word2: "practice"))

func shortestDistance2(_ words: [String], word1: String, word2: String) -> Int {
    var idx = -1
    var res = Int.max
    for i in 0..<words.count {
        if words[i] == word1 || words[i] == word2 {
            if idx != -1 && words[i] != words[idx] {
                res = min(res, abs(i - idx))
            }
            idx = i
        }
    }
    return res
}
print(shortestDistance2(["practice", "makes", "perfect", "coding", "makes"], word1: "coding", word2: "practice"))

let dirs = [[0, -1], [-1, 0], [0, 1], [1, 0]]
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    let m = grid.count, n = grid[0].count
    var grid = grid
    var res = 0
    for i in 0..<m {
        for j in 0..<n {
            if grid[i][j] != 1 { continue }
            var cnt = 0
            helper(&grid, i: i, j: j, cnt: &cnt, res: &res)
        }
    }
    return res
}
func helper(_ grid: inout [[Int]], i: Int, j: Int, cnt: inout Int, res: inout Int) {
    let m = grid.count, n = grid[0].count
    if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] <= 0 { return }
    cnt+=1
    res = max(res, cnt)
    grid[i][j] *= -1
    for dir in dirs {
        helper(&grid, i: i + dir[0], j: j + dir[1], cnt: &cnt, res: &res)
    }
}
print(maxAreaOfIsland([[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]]));


func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var res: [Int] = [Int]()
    var nums = nums
    for i in 0..<nums.count {
        let idx = abs(nums[i]) - 1
        nums[idx] = (nums[idx] > 0) ? -nums[idx] : nums[idx]
    }
    for i in 0..<nums.count {
        if nums[i] > 0 {
            res.append(i + 1)
        }
    }
    return res
}
print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))

func findDisappearedNumbers1(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    var nums = nums
    var i = 0
    while i < nums.count {
        if nums[i] != nums[nums[i] - 1] {
            nums.swapAt(i, nums[i] - 1);
        } else {
            i += 1;
        }
    }
    
    for i in 0..<nums.count {
        if nums[i] != i + 1 {
            res.append(i + 1)
        }
    }
    return res
}
print(findDisappearedNumbers1([4,3,2,7,8,2,3,1]))

func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    var nums = nums
    let n = nums.count
    for i in 0..<nums.count {
        let idx = nums[i] - 1
        nums[idx % n] += n
    }
    for i in 0..<n {
        if nums[i] <= n {
            res.append(i + 1)
        }
    }
    return res
}
print(findDisappearedNumbers2([4,3,2,7,8,2,3,1]))

func isOneBitCharacter(_ bits: [Int]) -> Bool {
    let n = bits.count
    var i = 0
    while i < n - 1 {
        i += bits[i] + 1
    }
    return  i == n - 1
}
print(isOneBitCharacter([1,1,1,0]))

func isOneBitCharacter1(_ bits: [Int]) -> Bool {
    if bits.isEmpty { return false }
    if bits.count == 1 { return bits[0] == 0 }
    var t = Array<Int>()
    if bits[0] == 0 {
        t = Array(bits[1..<bits.endIndex])
    } else if bits[0] == 1 {
        t = Array(bits[2..<bits.endIndex])
    }
    return isOneBitCharacter1(t)
}
print(isOneBitCharacter1([1,1,0,0]))

func isOneBitCharacter2(_ bits: [Int]) -> Bool {
    return helper(bits, idx: 0)
}
func helper(_ bits: [Int], idx: Int) -> Bool {
    let n = bits.count
    if idx == n { return false }
    if idx == n - 1 { return bits[idx] == 0 }
    if (bits[idx] == 0) { return helper(bits, idx: idx + 1) }
    return helper(bits, idx: idx + 2)
}
print(isOneBitCharacter2([1,1,0,0]))

var nums = [2, 1]
func moveZeros(_ nums: inout [Int]) {
    var i = 0, j = 0
    while i < nums.count {
        if nums[i] != 0 {
            if  i != j  {
                nums.swapAt(i, j)
            }
            j += 1
        }
        i += 1
    }
}
moveZeros(&nums)
print(nums)
