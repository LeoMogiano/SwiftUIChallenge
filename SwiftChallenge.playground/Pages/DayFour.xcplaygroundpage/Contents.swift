import Foundation

// Type Annotations

let surname: String = "Lasso"
var score: Int = 30

let playerName: String =  "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthneticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id" : "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
//initialization
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()


enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.dark
style = .light

var style2:  UIStyle = .system
print(style2)

// Checkpoint 2

// Create an array of String, then write some code that prints the number of items in the array an also the number of unique items in the array.

//EXAMPLE 1
let arrayStrings: [String] = ["Moises", "Leonardo", "Mogiano", "Gutierrez", "Mogiano"]

print("The number of items for arrayStrings is \(arrayStrings.count)")

var uniqueItems = Set<String>()
    
for value in arrayStrings {
//    print(value)
    uniqueItems.insert(value)
    
}
print("The number of items for uniqueItems is \(uniqueItems.count)")

//EXAMPLE 2
let arrayString2 = ["Jose", "Jose", "Mogiano", "Messi"]

print("La cantidad de items en arrayStrins2 es \(arrayString2.count)")

var uniqueItems2 = Set<String>() // Sets requires types annotations

for item in arrayString2 {
    uniqueItems2.insert(item)
}

print("La cantidad de items en uniqueItems2 es \(uniqueItems2.count)")
