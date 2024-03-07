 import Foundation


// Structs

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() -> Void {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red   = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    
   mutating func takeVacation(days: Int) -> Void {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remainig \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
    
}

var archer = Employee(name: "Leo Mogiano", vacationRemaining: 30)
archer.takeVacation(days: 30)
print(archer.vacationRemaining)


// Compute property values dynamically
print()
struct EmployeeXD {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archer2 = EmployeeXD(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)


// Compute property values dynamically V2
print()
struct EmployeeXS {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer3 = EmployeeXS(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
archer3.vacationRemaining = 5
print(archer3.vacationAllocated)

print()
// Observers in Structs

// These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.

struct GameX {
    var score = 0
}

var gameX = GameX()
gameX.score += 10
print("Score is now \(gameX.score)")
gameX.score -= 3
print("Score is now \(gameX.score)")
gameX.score += 1

print()
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


// If you want it, Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality
// based on what you were changing from. There’s also a willSet variant that runs some code before the property changes, which in turn provides
// the new value that will be assigned in case you want to take different action based on that.

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
print()
app.contacts.append("Allen W")
print()
app.contacts.append("Ish S")
print()

// In practice, willSet is used much less than didSet, but you might still see it from time to time so it’s important you know it exists.

// Custom Initializator

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
