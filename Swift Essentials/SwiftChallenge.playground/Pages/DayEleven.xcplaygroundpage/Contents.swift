import Foundation

// Access Control Internal Data

struct BankAccount {
    private(set) var funds = 0 // You are allowed to access but you can't modify
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
print(account.funds)
//account.funds -= 1000

print()
// Static properties and methods

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// Checkpoint 6

//Create a struct to store car information: model, seats, and gear. Include a method to change gears.
//Consider which data should be mutable and what should be publicly accessible. Ensure gear changes are valid.

//Hints:
//
//Model and seat count are constants.
//The gear is mutable.
//Validate gear changes (no gear 0, max 10 gears).
//Consider access control and potentially create a custom initializer.
//Use mutating for methods modifying properties.

//Additional Info:
//
//Implement a static variable to track total cars.
//Add a static method to calculate maximum speed based on gears.
//Include another static method to print the total cars created.


struct Car {
    static var totalCars: Int = 0

    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1

    mutating func changeGear(to gear: Int) {
        if gear >= 1 && gear <= 10 {
            currentGear = gear
            print("\(model): Changed gear to \(currentGear)")
        } else {
            print("\(model): Invalid gear. Gear must be between 1 and 10.")
        }
    }

    static func maxSpeed(forNumberOfGears gears: Int) -> Int {
        return gears * 20 // Just a simple example calculation
    }

    static func printTotalCars() {
        print("Total cars created: \(totalCars)")
    }

    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        Car.totalCars += 1
    }
}


// Example Car
print()
// Create an instance of Car
var myCar = Car(model: "Toyota Camry", numberOfSeats: 5)

// Change the car's gear
myCar.changeGear(to: 3)

// Calculate the maximum speed for a certain number of gears
let maxSpeed = Car.maxSpeed(forNumberOfGears: myCar.currentGear)
print("Maximum speed for \(myCar.currentGear) gears: \(maxSpeed) mph")

// Print the total number of cars created
Car.printTotalCars()
