import Foundation

// Conditions

let score = 85

if score > 80 {
    print("Great Job!")
}

let speed = 88
let percentaje = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads")
}

if percentaje < 85 {
    print("Sorry, you failed the test")
}

if age <= 18 {
    print("You're elegible to vote")
}

let ourName = "LeoMogiano"
let friendName = "Rodrigo Olmedo"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(ourName) vs \(friendName)")
}

var numbers = [1,2,3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'Day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var username = ""

// first way
if username == ""{
    username = "Anonymous"
}

// inefficient way
//if username.count == 0 {
//    username = "Anonymous"
//}

//efficient way
if username.isEmpty == true {
    username = "Anonymous"
}

print("Welcome, \(username)")

// Multiple Conditions

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day")
}

let a = true
let b = false

if a {
    print("The code run is \"a\" is true")
} else if b {
    print("The code run is \"b\" is true")
} else {
    print("The code run is both are false ")
}

var userAge = 14
var letHasParentalConsent = true

if age >= 18 || letHasParentalConsent == true {
    print("You can buy this game!")
}

enum TransportOption {
    case airplane, helicopter, bycicle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bycicle {
    print("I hope theres is a bike path")
} else if transport == .car {
    print("Time to get stuck in traffict.")
} else {
    print("I'm going to hire a scooter now xd!")
}

// Switch Statements

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

// not a recommended way
if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelle")
case .unknown:
    print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

// Ternary Conditionals

let mogiAge = 23

let canVote = age >= 18 ? "Yes" : "No"

print(canVote)

// ternary example
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")
// if example

if hour < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}

// Not too recommended

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
