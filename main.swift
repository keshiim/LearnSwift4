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

func maxProfit(_ prices: [Int]) -> Int {
    var res = 0, buy = Int.max
    for price in prices {
        buy = min(buy, price)
        res = max(res, price - buy)
    }
    return res
}
print(maxProfit([7, 1, 5, 3, 6, 4]))
print(maxProfit([7, 6, 4, 3, 1]))

func maxProfit1(_ prices: [Int]) -> Int {
    var res = 0, i = 0
    let n = prices.count
    while i < n - 1 {
        if prices[i] < prices[i + 1] {
           res += prices[i + 1] - prices[i]
        }
        i += 1
    }
    return res
}
print(maxProfit1([3, 2, 3, 5, 3, 6]))

func maxProfit2(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    let n = prices.count
    var g = [[Int]](repeating: [Int](repeatElement(0, count: 3)), count: n)
    var l = [[Int]](repeating: [Int](repeatElement(0, count: 3)), count: n)
    for i in 1..<n {
        let diff = prices[i] - prices[i - 1]
        for j in 1...2 {
            l[i][j] = max(g[i - 1][j - 1] + max(diff, 0), l[i - 1][j] + diff)
            g[i][j] = max(l[i][j], g[i - 1][j])
        }
    }
    print(g)
    return g[n - 1][2]
}
print(maxProfit2([3,2,6,5,0,3]))


func maxProfit22(_ prices: [Int]) -> Int {
    var buy1 = Int.min, buy2 = Int.min
    var  sell1 = 0, sell2 = 0
    for price in prices {
        sell2 = max(sell2, buy2 + price)
        buy2 = max(buy2, sell1 - price)
        sell1 = max(sell1, buy1 + price)
        buy1 = max(buy1, -price)
    }
    return sell2;
}

func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    if prices.count <= k {
        return solveMaxProfit(prices)
    }
    var g = [Int](repeatElement(0, count: k + 1))
    var l = [Int](repeatElement(0, count: k + 1))
    for i in 0..<prices.count - 1 {
        let diff = prices[i + 1] - prices[i]
        var j = k
        while (j >= 1) {
            l[j] = max(g[j - 1] + max(0, diff), l[j] + diff)
            g[j] = max(l[j], g[j])
            j -= 1
        }
    }
    return g[k]
}
func solveMaxProfit(_ prices: [Int]) -> Int {
    var res = 0
    for i in 1..<prices.count {
        if prices[i] - prices[i - 1] > 0 {
            res += prices[i] - prices[i - 1]
        }
    }
    return res
}
print(maxProfit(2, [6,1,3,2,4,7]))

func maxProfit4(_ prices: [Int]) -> Int {
    var pre_buy = 0, buy = Int.min, pre_sell = 0, sell = 0
    for price in prices {
        pre_buy = buy
        buy = max(pre_sell - price, pre_buy)
        pre_sell = sell
        sell = max(pre_buy + price, pre_sell)
    }
    return sell
}
print(maxProfit4([6,1,3,2,4,7]))


func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if m <= 0 && n <= 0 {
        return
    }
    var a = 0, b = 0
    var merged = [Int](repeatElement(0, count: m + n))
    for i in 0..<m + n {
        if a < m && b < n {
            //都有数据
            if nums1[a] < nums2[b] {
                merged[i] = nums1[a];
                a += 1
            } else {
                merged[i] = nums2[b]
                b += 1
            }
        } else if a < m && b >= n {
            // nums2 耗尽
            merged[i] = nums1[a]
            a += 1
        } else if a >= m && b < n {
            // nums1 耗尽
            merged[i] = nums2[b]
            b += 1
        } else  {
            return
        }
    }
    for i in 0..<m + n {
        nums1[i] = merged[i]
    }
}
var nums1 = [1, 2, 4, 5, 6, 0]
merge(&nums1, 5, [3], 1)
print(nums1)


func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var count = m + n - 1
    var m = m - 1
    var n = n - 1
    while m >= 0 && n >= 0 {
        if nums1[m] > nums2[n] {
            nums1[count] = nums1[m];
            m -= 1
        } else {
            nums1[count] = nums2[n]
            n -= 1
        }
        count -= 1
    }
    while n >= 0 {
        nums1[count] = nums2[n]
        count -= 1
        n -= 1
    }
}
var nums11 = [1]
merge1(&nums11, 1, [0], 0)
print(nums11)

func findShortestSubArray(_ nums: [Int]) -> Int {
    let n = nums.count
    var degree = 0, res = Int.max
    var m = [Int: Int]()
    var pos = [Int: [Int]]()
    for i in 0..<n {
        let num = nums[i]
        let count = (m[num] ?? 0) + 1 //次数累加
        m[num] = count
        if count == 1 {
            //说明第一次记录
            pos[num] = [i, i]
        } else {
            let position = pos[num]
            pos[num] = [(position?.first)!, i];
        }
        degree = max(degree, count)
    }
    for (num, count) in m {
        if count == degree {
            res = min(res, (pos[num]?.last)! - (pos[num]?.first)! + 1)
        }
    }
    return res
}
print(findShortestSubArray([1,2,2,3,1,4,2]))

func findShortestSubArray1(_ nums: [Int]) -> Int {
    let n = nums.count
    var res = Int.max, degree = 0
    var m = [Int: Int](), startIdx = [Int: Int]()
    for i in 0..<n {
        m[nums[i]] = (m[nums[i]] ?? 0) + 1 //先设置出现次数
        if startIdx[nums[i]] == nil {
            startIdx[nums[i]] = i  //设置初始位置
        }
        if m[nums[i]] == degree {
            res = min(res, i - startIdx[nums[i]]! + 1)
        } else if m[nums[i]]! > degree {
            res = i - startIdx[nums[i]]! + 1
            degree = m[nums[i]]!
        }
    }
    return res
}
print(findShortestSubArray1([1,2,2,3,1,4,2]))

func findLengthOfLCIS(_ nums: [Int]) -> Int {
    
    var res = 0, cnt = 0, pre = Int.max
    for num in nums {
        if pre < num { cnt += 1 }
        else { cnt = 1 }
        res = max(res, cnt)
        pre = num
    }
    return res
}
print(findLengthOfLCIS([1,3,5,4,7]))

func findNumberOfLIS1(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    }
    var maxLen = 1, res = 0
    let n = nums.count
    var len = [Int](repeating: 1, count: n)
    var cnt = [Int](repeating: 1, count: n)
    for i in 1..<n {
        for j in 0..<i {
            if nums[j] < nums[i] {
                if len[j] + 1 > len[i] {
                    len[i] = len[j] + 1
                    cnt[i] = cnt[j]
                } else if len[j] + 1 == len[i] {
                    cnt[i] += cnt[j]
                }
            }
        }
        maxLen = max(maxLen, len[i])
    }
    for i in 0..<n {
        if maxLen == len[i] { res += cnt[i] }
    }
    return res
}
print(findNumberOfLIS1([]))

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var pre = 0, cur = 0
    let n = nums.count
    while cur < n {
        if nums[pre] == nums[cur] { cur += 1 }
        else {
            pre += 1
            nums[pre] = nums[cur]
            cur += 1
        }
    }
    return pre + 1
}
var removeDuplicatesArray = [1,1,2]
print("length: \(removeDuplicates(&removeDuplicatesArray)) of \(removeDuplicatesArray)")

