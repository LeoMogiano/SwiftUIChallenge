import Foundation

// Clousure Structures

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser  // It looks pretty strange
greetCopy()

// other way

let sayHello = {print("Hi there 2.0!")}
sayHello()

let sayHello2 = {(name: String) -> String in
    "Hi \(name)"
}

sayHello2("Mogi")

// Data type example

var greetCopy2: () -> Void = greetUser
 
var responseGreet = greetCopy2()
//print(responseGreet)

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData

let user = data(1989)

print(user)
print()

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)
print()

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)
print()
// example why use clousures
let captainFirstTeamXd = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeamXd)
print()

// using trailling clousures

let captainFirstTeamXd2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
print(captainFirstTeamXd2)
print()
// automatic variables args - not recommendable here

let captainFirstTeamXd3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

print(captainFirstTeamXd3)
print()

// recommended way

let reverseTeam = team.sorted {
    return $0 > $1
}

let reverseTeam2 = team.sorted { $0 > $1 }

print(reverseTeam2)
print()

// recommended way 2

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)
print()

// recommended way 3

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// using functions as a params

func generateNumber() -> Int {
    Int.random(in: 1...20)
}


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 3, using: generateNumber)
print(rolls)
print()

let rolls2 = makeArray(size: 4, using: {Int.random(in: 1...20)})
print(rolls2)
print()

// Another example

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}


doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
print()
doImportantWork(first: { print("Work1") }, second: { print("Work2") }, third: { print("Work3") })
print()

// Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers
    .filter { $0 % 2 != 0 } // Filtrar los números pares
    .sorted() // Ordenar en orden ascendente
    .map { "\($0) is a lucky number" } // Mapear al formato deseado
    .forEach { print($0) } // Imprimir cada elemento

print()
// other way

let luckyNumbers2 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers2
    .filter { !$0.isMultiple(of: 2) } // Filter out even numbers
    .sorted() // Sort in ascending order
    .map { "\($0) is a lucky number" } // Map to the desired format
    .forEach { print($0) } // Print each item


