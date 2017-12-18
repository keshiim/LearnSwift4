//: Playground - noun: a place where people can play

import Cocoa

//错误处理

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//func canThrowErrors() throws -> String {
//
//}
//func cannotThrowErrors() -> String {
//
//}

struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = ["Candy Bar": Item(price: 12, count: 7),
                     "Chips": Item(price: 10, count: 4),
                     "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
}
let favoriteSnacks = ["Alice": "Chips",
                      "Bob": "Licorice",
                      "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snakeName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snakeName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Instufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

//func processFile(fileName: String) throws {
//    if exists(fileName) {
//        let file = open(fileName)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            
//        }
//    }
//}




