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
