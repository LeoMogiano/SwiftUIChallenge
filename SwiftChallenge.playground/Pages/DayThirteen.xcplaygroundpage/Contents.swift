import Foundation

// Protocols like Interfaces
// Establish  contracts

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}


struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    var name = "bike"
    var currentPassengers = 0
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}


func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)
print()

let bike = Bicycle()
commute(distance: 50, using: bike)
print()

getTravelEstimates(using: [car, bike], distance: 150)
print()

// Create and use extensions
// makes mor easy to read

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim() {
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()
quote.trim()

// other common example

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmedValue = trim(quote)


let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines)
print()

// trick - to have 2 initializator

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// Checkpoint 8

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    
    func salesSummary()
}

struct House: Building {
    let numberOfRooms: Int
    let cost: Int
    let estateAgent: String
    
    func salesSummary() {
        print("House with \(numberOfRooms) rooms, cost: $\(cost), sold by \(estateAgent).")
    }
}

struct Office: Building {
    let numberOfRooms: Int
    let cost: Int
    let estateAgent: String
    
    func salesSummary() {
        print("Office with \(numberOfRooms) rooms, cost: $\(cost), sold by \(estateAgent).")
    }
}

// Example usage
let myHouse = House(numberOfRooms: 4, cost: 350000, estateAgent: "John Doe")
myHouse.salesSummary()
print()

let myOffice = Office(numberOfRooms: 10, cost: 1000000, estateAgent: "Jane Smith")
myOffice.salesSummary()

