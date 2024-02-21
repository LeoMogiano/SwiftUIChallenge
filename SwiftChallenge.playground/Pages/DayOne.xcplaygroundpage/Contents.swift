// String Structure

import Foundation

let name = "Leo Mogiano"
let file = "photo.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Hola Xd \"Mogi\" Xd."

let movie = """
A day in
the life of an
Apple engineer
"""
let nameLength = name.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(file.hasSuffix(".jpg"))

// Number Structure

let score = 10
let reallyBig = 1_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let helvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter -= 5
counter *= 5
counter /= 2

let number = 120
print(number.isMultiple(of: 3))

print(reallyBig)

// DecimalStructure

let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
let c = a + Int(b)
let d = Double(a) + b

print("This is a Int : \(c)")

print("This is a Double : \(d)")

