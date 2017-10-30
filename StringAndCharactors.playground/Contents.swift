//: Playground - noun: a place where people can play

import Cocoa

let someString = "Some string literal value."

let quotation = """
The white rabbit put on his spectacles.  "where shall I begin.
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, and go on
till you come to the end; then stop."
"""
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quote \"\"\"
"""
print(quotation)
print(threeDoubleQuotes)

let singleLineString = "These are the same"
let multilineString = """
There are the same
"""

func generateQuotation() -> String {
    let quotation = """
        The white rabbit put on his spectacles.  "where shall I begin.
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, and go on
        till you come to the end; then stop."
        """
    return quotation
}
print(generateQuotation())
print(quotation == generateQuotation())

var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += "and another Highlander" //compile-time error

for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["c", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString);
//print "cat!🐱"

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

//let exclamationMark: Character = "!"
welcome.append(exclamationMark)

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)) * 2.5"
// message is "3 times 2.5 is 7.5"

let wiseWords = "\"Imagination is more improtant than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let eAcute: Character = "\u{e9}" // é
let combinedEAcute: Character = "\u{65}\u{301}"
// eAcute is é, combinedEAcute is é
let precomposed: Character = "\u{d55c}" //한
let decomposeed: Character = "\u{1112}\u{1161}\u{11ab}" // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1f1fa}\u{1f1f8}"

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// prints "unusualMenagerie has 40 characters"

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
//prints "the number of characters in cafe is 4"
word += "\u{301}" // COMBINING ACUTE ACCENT, U+301
print("the number of characters in \(word) is \(word.characters.count)")
//prints "the number of characters in café is 4"

let greeting = "Guten Tag!"
print(greeting.startIndex)
greeting[greeting.startIndex] //G
greeting[greeting.index(before: greeting.endIndex)] //!
greeting[greeting.index(after: greeting.startIndex)]//u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//greeting[greeting.endIndex] //运行时报错
//greeting.index(after: greeting.endIndex)

for index in greeting.characters.indices {
//    print("\(greeting[index])")
    print("\(greeting[index])", separator: " ", terminator: " ") //G u t e n   T a g !
}

var wellcome = "hello"
wellcome.insert("!", at: wellcome.endIndex)
wellcome.insert(contentsOf: " there".characters, at: wellcome.index(before: wellcome.endIndex))

wellcome.remove(at: wellcome.index(before: wellcome.endIndex))
wellcome.removeSubrange(wellcome.index(wellcome.endIndex, offsetBy: -6)..<wellcome.endIndex)

let quotation1 = "We`re a lot alike, you and I."
let sameQuotation = "We`re a lot alike, you and I."
if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{e9}?"
// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAuteQuestion = "Voulez-vous un caf\u{65}\u{301}"
if eAcuteQuestion == combinedEAuteQuestion {
    print("These two strings are considered equal") // prints "These two strings are considered equal"
}

let romeoAndJuliet = ["Act 1 Scene 1: Verona, A public place",
                      "Act 1 Scene 2: Capulet's mansion",
                      "Act 1 Scene 3: A room in Capulet's mansion",
                      "Act 1 Scene 4: A street outside Capulet's mansion",
                      "Act 1 Scene 5: The Great Hall in Capulet's mansion",
                      "Act 2 Scene 1: Outside Capulet's mansion",
                      "Act 2 Scene 2: Capulet's orchard",
                      "Act 2 Scene 3: Outside Friar Lawrence's cell",
                      "Act 2 Scene 4: A street in Verona",
                      "Act 2 Scene 5: Capulet's mansion",
                      "Act 2 Scene 6: Friar Lawrence's cell"]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit)", terminator: " ")
}
print("")

for codeUint in dogString.utf16 {
    print("\(codeUint)", terminator: " ")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

for codeUint in dogString.unicodeScalars {
    print("\(codeUint.value)", terminator: " ")
}
print("")
// 68 111 103 8252 128054
for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}
//D
//o
//g
//‼
//🐶

