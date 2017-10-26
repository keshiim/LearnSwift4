//: Playground - noun: a place where people can play

import Cocoa

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

let π = 3.141592653
let 你好 = "你好啊swift"
let `🐂🐶`: String = "cowdog"

let `let` = "let"
print(`let`)

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!" // friendlyWelcome 现在是 "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++" // this is a compile-time error - languageName cannot be changed

print(friendlyWelcome) // 输出 “Bonjour!”

let minValue = UInt8.min
let maxValue = UInt8.max

let meaningOfLife = 42
let pi = 3.14159

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillon = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi_ = Double(three) + pointOneFourOneFiveNine

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.max

let orangesAreOrage = true
let trunipsAreDelicious = false
if trunipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status code is \(http404Error.0)")

print("The status message is \(statusMessage)")
print("The status message is \(http404Error.1)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is  \(http200Status.statusCode)")
print("The status description is  \(http200Status.1)")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")//prints "4 < 42 < 100"
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")//prints "4 < 42 < 100"
        }
    }
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}
if let definiteString = assumedString {
    print(definiteString)
}

func canThrowAnError() throws {
    // this function may or may not throw an error
}
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    //an error was thrown
}

//func makeASandwich() throws {
//    // ...
//}
//do {
//    try makeASandwich()
//    //eatASandwich()
//} catch Error.OutOfCleanDishes {
//    //washDishes()
//} catch Error.MissingIngredients(let ingredients) {
//    //buyGroceries(ingredients)
//}

let age = -3
assert(age >= 0, "A person`s age cannot be less than zero.")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person`s age can`t be less than zero.")
}
// In the implementation of a subscript...
precondition(age > 0, "A person`s age can`t be less than zero.")
preconditionFailure("A person`s age can`t be less than zero.")
fatalError("crash here")

