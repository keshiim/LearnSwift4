//: Playground - noun: a place where people can play

import Cocoa

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    //行星
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
//print Where the sun rises

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prins "Mossly harmless"

enum Barcode {
    //关联值
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 4567, 7890, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint1: String {
    case north, south, east, west
}

let earthsOrder = Planet1.earth.rawValue
let sunsetDirection = CompassPoint1.west.rawValue

let possiblePlanet = Planet1(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.Uranus

let positionToFind = 11
if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn`t a planet at position \(positionToFind)")
}

enum ArithmeticExpresstion {
    case number(Int)
    indirect case addition(ArithmeticExpresstion, ArithmeticExpresstion)
    indirect case multiplication(ArithmeticExpresstion, ArithmeticExpresstion)
}

let five = ArithmeticExpresstion.number(5)
let four = ArithmeticExpresstion.number(4)
let sum  = ArithmeticExpresstion.addition(five, four)
let product = ArithmeticExpresstion.multiplication(sum, ArithmeticExpresstion.number(2))
func evaluate(_ expression: ArithmeticExpresstion) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))

func arrayPairSum(_ nums: [Int]) -> Int {
    var res = 0
    let n = nums.count
    let numsSored = nums.sorted{ $0 < $1 }
    print(numsSored)
    for i in stride(from: 0, to: n, by: 2) {
        res += numsSored[i]
    }
    return res
}

print(arrayPairSum([1, 2, 3, 2]))
