import Cocoa

// Boolean Structure

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print("gameOver : \(gameOver)")
gameOver.toggle()
print("gameOver : \(gameOver)")

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// String Interpolation

let people = "Haters"
let action = "hate"

let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3"
print(luggageCode)


let name = "Julian"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
let missionMessage = "Apollo \(number) landed on the moon."
print(missionMessage)

print("5 x 5 is \(5 * 5)")

// Summary / Resumen

// Swift lets us create constants using let, and variables using var
// Swift nos permite crear constantes usando let, y variables usando var

// Swift's strings contain text, from short strings up to whole novels
// Los String de Swift contienen texto, desde pequeños strings hasta novelas enteras

// You can create strings by using double quotes at the start and end
// Puedes crear strings usando comillas dobles al principio y al final

// You can create strings spanning multiple lines by using triple double quotes at the start and end
// Puedes crear strings que abarcan varias líneas usando triples comillas dobles al principio y al final

// Swift calls its whole numbers integers, or Int
// Swift llama a sus números enteros: integers, o Int

// In Swift, decimal numbers are called Doubles, which are not suitable for precise values like money
// En Swift, los números decimales se llaman Double, los cuales no son adecuados para valores precisos como el dinero

// You can store a simple true or false value using a Boolean, or Bool
// Puedes almacenar un simple valor verdadero o falso usando un Boolean, o Bool

// String interpolation allows us to efficiently insert data into strings
// La interpolación de cadenas nos permite insertar datos en cadenas de manera eficiente
