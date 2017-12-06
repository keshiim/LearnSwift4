//: Playground - noun: a place where people can play

import Cocoa
//ARC

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is beiing deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

class Person1 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var department: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person1?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var john: Person1?
var unit4A: Apartment?
john = Person1(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
john?.department = unit4A
unit4A?.tenant = john
john = nil
unit4A = nil

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var jon: Customer?
jon = Customer(name: "Jon appleseed")
jon?.card = CreditCard(number: 1234_5678_9012_3456, customer: jon!)
jon = nil

class Country {
    let name: String
    var capiitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capiitalCity = City(name: capitalName, country: self)
    }
    init(name: String) {
        self.name = name
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "China", capitalName: "beijing")
print("\(country.name)`s capital city is called \(country.capiitalCity.name)")


class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitiallized")
    }
}
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil
