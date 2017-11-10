//: Playground - noun: a place where people can play

import Cocoa

//闭包 -- 可以写的如此简单
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
//1
var reversedNames = names.sorted(by: backward)// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//2
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames)
//3
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: >)

//尾随闭包
reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }

func someFunctionThatTakesAClosure(closure: () -> Void) {
    //function body goes here
}

//here`s how you call this function without using a trailing closure
someFunctionThatTakesAClosure(closure: {
    //closure`s body goes here
})
//here`s how you call this function with a trailing closure instead
someFunctionThatTakesAClosure {
    //trailing closure`s body goes here
}
let digitNames = [0: "zero", 1: "One", 2: "Two",  3: "Three", 4: "Four",
                  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)
// prints ["OneSix", "FiveEight", "FiveOnezero"]

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTwo = makeIncrementer(forIncrement: 2)
print(incrementByTwo())
print(incrementByTwo())
print(incrementByTwo())

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())

let alsoIncrementByTwo = incrementByTwo
print(alsoIncrementByTwo())

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHanlder: @escaping () -> Void) {
    completionHandlers.append(completionHanlder)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 11
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//延时求值
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0)}
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve { customersInLine.remove(at: 0)}

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
print("customers: \(customersInLine)")
