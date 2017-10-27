//: Playground - noun: a place where people can play

import Cocoa

let b = 10
var a = 4
a = b // a的值现在是10

let (x, y) = (1, 2)

/*
if x = y {
    //这里不合法，因为x = y并不会返回任何值
}
 */

let three = 3
let minusThree = -three // minusThree equals -3
let plusThree = -minusThree // plusThree equals 3, or "minus minus three"

let minusSix = -6
let alsoMinusSix = +minusSix //alsoMinusSix equals -6

var c = 1
c += 2

let name = "world"
if name == "world" {
    print("Hello, world")
} else {
    print("I`m sorry \(name), but I don`t recongnize you")
}

(1, "zebra") < (2, "apple")   // true because 1 is less than 2
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i]).")
}

for name in names[2...] {
    print(name)
    //Brian
    //Jack
}
for name in names[1...2] {
    print(name)
    //Alex
    //Brian
}
for name in names[..<2] {
    print(name)
    //Anna
    //Alex
}

let range = ...5
range.contains(9)
range.contains(4)
range.contains(-1)
