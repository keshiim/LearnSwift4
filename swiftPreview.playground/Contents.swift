//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let data: Data = Data.init()
let json = try? JSONSerialization.jsonObject(with: data, options: [])
if let dictionary = json as? [String: Any] {
    print(dictionary)
}


struct Restaurant {
    enum Meal: String {
        case breakfast, lunch, dinner
    }
    
    let name: String
    let location: (latitude: Double, longtitude: Double)
    let meals: Set<Meal>
    
}

extension Restaurant {
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String, let coordinatesJSON = json["coordinates"] as? [String: Double], let latitude = coordinatesJSON["lat"], let longitude = coordinatesJSON["lng"], let mealsJSON = json["meals"] as? [String] else {
            return nil
        }
        
        var meals: Set<Meal> = []
        for string in mealsJSON {
            guard let meal = Meal(rawValue: string) else { return nil }
            meals.insert(meal)
        }
        
        self.name = name
        self.location = (latitude, longitude)
        self.meals = meals
    }
}

Restaurant.init(json: [:] as! [String: Any])

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil//"John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, nobody"
}


let nickName: String? = nil
let informalGreeting = "Hi \(nickName ?? "You")"

var vegetable: String = "red pepper"
switch vegetable {
case "celery":
    print("Add come raisions and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let y where y.hasPrefix("red") :
    print("\(y)<<<")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 1, 2],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestCatory = ""
for (key, numbers) in interestingNumbers {
    for number in numbers {
//        largest = number > largest ? number : largest
        if number > largest {
            largestCatory = key
            largest = number
        }
    }
}
print("\(largestCatory) = \(largest)")

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
let _nn = greet("keshiim", on: "Thursday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 3, 1, 233)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeincrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
let increment = makeincrementer()
increment(7)

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
hasAnyMatchs(list: numbers, condition: lessThanTen)
numbers.map { (number: Int) -> Int in
    let result = 2 * number
    return result
}
print(numbers)

let mappedNumbers = numbers.map({ number in
    3*number
})

let sortedNumbers = numbers.sorted {
    $0 > $1
}

class Shape {
    var numberOfSides = 0
    let constA = 2
    func foo(number: Int) {
        print(constA)
    }
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 4
shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with Sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.5, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return radius * radius * Double.pi
    }
    
    override func simpleDescription() -> String {
        return "A Circle with radius of area \(area())."
    }
}
let circle = Circle(radius: 2, name: "ACaa")
circle.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)

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

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 6999
    func adjust() {
        simpleDescription += " Now 100% adjueted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A very simple struct."
    mutating func adjust() {
        simpleDescription += " (adjusted)."
    }
}
var b = SimpleStruct()
b.adjust()
let bDescription = b.simpleDescription

enum SimpleEnum: ExampleProtocol {
    case test(String)
    var simpleDescription: String {
        get {
            switch self {
            case let .test(text):
                return text
            default:
                return "A very simiple Enum."
            }
        }
    }
    func adjust() {
        print(" Now (adjusted).")
    }
}
var c = SimpleEnum.test("hello")
c.simpleDescription
c.adjust()

extension Int: ExampleProtocol {
    var simpleDescription: String {
        get {
            return "The number \(self)"
        }
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

extension Double {
    var absoluteValue: Double {
        return fabs(self)
    }
}
print((-4.2).absoluteValue)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

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
do {
    let printerResponse = try send(job: 1008, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

//catch 模式
do {
    let printerResponse = try send(job: 1110, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I`ll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1882, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1002, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

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
possibleInteger.simpleDescription()
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

//func anyCommonElements<T: Sequence, U:Sequence>(_ lhs: T, _ rhs: U) -> T where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
//
//}

