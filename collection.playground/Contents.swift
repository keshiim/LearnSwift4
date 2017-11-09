//: Playground - noun: a place where people can play

import Cocoa
//var someInts = Array<Int>()//完整数组声明
var someInts = [Int]() //简写数组声明
print("someInts is of type[Int] with \(someInts.count) items.")

someInts.append(2)
//someInts now contains 1 value of type Int
someInts = []
//someInts is now an emtpy array, but is still of type [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

var shoppingList: [String] = ["Egg", "Milk"]
//also
//var shoppingList = ["Egg", "Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is emtpy.")
} else {
    print("The shopping list is not emtpy.")
}
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
var fristItem = shoppingList[0]
shoppingList[0] = "Six eggs"
print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
// letters now contains 1 value ('a') of type Charactor
print(letters)
letters = []
print(letters)
// letters is now an empty set, but is still of type Set<Character>

var favoriteGenres: Set<String> = ["Rock",  "Classical", "Hip hop"]
// favroiteGenres has been initialized with three initial items

for genre in favoriteGenres {
    print(genre)
}
//Hip hop
//Rock
//Classical
for genre in favoriteGenres.sorted() {
    print(genre)
}
//Classical
//Hip hop
//Rock

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))

var nameOfIntegers = [Int: String]()
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:]

var airports: [String: Any] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports.updateValue(1, forKey: "a")
airports.updateValue("string", forKey: "s")
print(airports)
