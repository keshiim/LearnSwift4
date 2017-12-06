//: Playground - noun: a place where people can play

import Cocoa

//可选链 optional-chaining

class Person {
    var residence: Residence?
}
class Addresss {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() {
        if buildingName != nil
        {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
class Room {
    let name: String
    init(name: String) { self.name = name }
}
class Residence {
    var numberOfRooms: Int {
        return rooms.count
    }
    var rooms = [Room]()
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
let john = Person()
let roomCount = john.residence?.numberOfRooms
if let roomCount = john.residence?.numberOfRooms {
    print("John`s residence has \(roomCount) rooms")
} else {
    print("Unable to retrieve the number of rooms.")
}
john.residence = Residence()

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
//if (john.residence?.address = someAddress) != nil {
//    print("It was possible to set the address.")
//} else {
//    print("It was not possible to set the address.")
//}
//// Prints "It was not possible to set the address."

var testScores = ["Dave": [876,54,3333], "Bev": [12,44,5]]
testScores["Dave"]?[0] = 91
