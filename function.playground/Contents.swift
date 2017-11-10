//: Playground - noun: a place where people can play

import Cocoa

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "zheng"))

func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld())

func greetAgain(person: String) -> String {
    return "Hello again, \(person)!"
}
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

//func greet(person: String) {
//    print("Hello, \(person)!")
//}

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWihoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWihoutCounting(string: "hello, world")

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
print(minMax(array: [1, 2, -4, 3, 74]))

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
print(minMax2(array: [1, -3, 1, 2, 67]) ?? "")
print(minMax2(array: []) ?? "")

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(firstParameterName: 1, secondParameterName: 2)

func someFunction(argumentLabel parameterName: Int) {
    
}
func someFunction(_ firstParameterName: Int, secondParamterName: Int) {
    
}
someFunction(1, secondParamterName: 2)

func someFunction(parameterWithDefault: Int = 12) {
    
}
someFunction(parameterWithDefault: 6)
someFunction()

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(numbers: 3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
// prints "Result: 5"
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
var moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1}
    func stepBackward(input: Int) -> Int { return input - 1}
    return backward ? stepBackward : stepForward
}
currentValue = -4
moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


