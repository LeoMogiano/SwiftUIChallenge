import Foundation

// Array Structure

var beatles = ["John", "Paul", "George", "Ringo"]

var numbers = [4, 8, 15, 16, 23, 42]

let temperatures = [25.3, 28.2, 26.4]

// index starts in 0

print(beatles[0])

print(numbers[1])

print(temperatures[2])

// add data - respective type data

beatles.append("Adrian")
beatles.append("Mogi")
print("Beatles (5) : \(beatles[4])")

numbers.append(55)
print("Numero [7] : \(numbers[6])")

// create an array type

var scores = Array<Int>()
scores.append(1)
scores.append(2)
scores.append(3)

print(scores)

// other way

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

print(albums[0])

// other way

var names : [String] = ["Mogi", "Leo"]
print(names[0])

// quantity in array

print("Cantidad de Albumes: \(albums.count)")

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print("Cantidad de Personajes : \(characters.count)")

// delete all in array

characters.removeAll()
print("Vaciado de Personajes : \(characters.count)")

// contains something

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print("Contiene la pelicula \"Spectre\" : \(bondMovies.contains("Spectre")) ")

// order in other way

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print("Ordenandolo al reves: \(cities.sorted()) ")

let presidents = [ "Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


// Dictionary Structure

// This example could be dangerous in the future
var employee = ["Taylor Swift", "Sing", "Nashville"]

print("Name : \(employee[0])")
// for example removing position 1 / causing new positions without [2]
employee.remove(at: 1)
//print("Job Title : \(employee[1])")
//print("Location : \(employee[2])")

// the correct way with dictionary

let employee2 = [
    "name" : "Taylor Swift",
    "job" : "Singer",
    "location" : "Nashville"
]

print(employee2["name", default: "Unkown"])
print(employee2["job", default: "Unkown"])
print(employee2["location", default: "Unkown"])

let hasGraduated = [
    "Eric" : false,
    "Mogi" : true,
    "Otis" : false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unkown"])

// add data in a dictionray

var heights = [String: Int]()

heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()

archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

print(archEnemies["Batman", default: "Unkown"])
print(archEnemies)
print(archEnemies.removeAll())

// Set Structure 
// Don't remember order and don't save duplicate values
// Fast way to find data

let actors = Set(["Leo", "Mogi"])
print(actors)

// add data

var actorsMovie = Set<String>()
actorsMovie.insert("Denzel Washington")
actorsMovie.insert("Tom Cruise")
print(actorsMovie)


// Enum Structure

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
print(day)

var day2 = Weekday2.friday
print(day2)


day = .thursday
print("El dia fue cambiado por \(day)")
