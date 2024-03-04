import Foundation

class Game {
    var score = 0 {
        didSet {
            print("Score now is \(score)")
        }
    }
    
    func addScore(score: Int) { // No mutating
        self.score += score
    }
}

var newGame = Game()

newGame.addScore(score: 5)
newGame.score += 10
print()
// Class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours")
    }
    
    override func printSummary() {
        print("xd")
    }
}


final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours")
    }
}

let mogiDeveloper = Developer(hours: 8)
mogiDeveloper.work()
mogiDeveloper.printSummary()
print()

let myManager = Manager(hours: 6)
myManager.printSummary()

// Add initializer for inherit classes

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) // In inherit classes you must call father initializer
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)
print()
// How to copy classes

// common mistake, this is the same piece of data

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1

user2.username = "Mogi"
print("Username1 : \(user1.username)")
print("Username2 : \(user2.username)")

print()

// In the case of structs doesn't happend the same

struct UserStruct {
    var username = "Anonymous"
}

var user1S = UserStruct()
var user2S = user1S
user1S.username = "Mogi"

print("Username1 : \(user1S.username)")
print("Username2 : \(user2S.username)")
print()
// correct way to copy with a different piece of data

class User2 {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var userCopy1 = User2()
var userCopy2 = userCopy1.copy()
userCopy1.username = "Mogi"

print("userCopy1 : \(userCopy1.username)")
print("userCopy2 : \(userCopy2.username)")
print()
// Deinitializer - just for clases

class UserInit {
    let id: Int

    init(id: Int) {
        self.id = id
        print("UserInit \(id): I'm alive!")
    }

    deinit {
        print("UserInit \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = UserInit(id: i)
    print("UserInit \(user.id): I'm in control!")
}

print()

var users = [UserInit]()

for i in 1...3 {
    let user = UserInit(id: i)
    print("UserInit \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
print()

// How to work with variables inside classes

// Constant class, constant property
// - Singpost that always points to the same user, who always has the same name

// Constant class, variable property
// - Singpost that always points to the same user, but their name can change

// Variable class, constant property
// - Singpost that can point to different user, but their name never change

// Variable class, variable property
// - Singpost that can pint to different user, but their name can change


// Checkpoint 7

//The problem is to create a class hierarchy for animals in Swift. It starts with the Animal class, followed by subclasses 
//Dog and Cat, and further subclasses like Corgi, Poodle, Persian, and Lion. Specific requirements include defining properties
//such as legsand isTame, and implementing methods like speak() with variations for each subclass.


class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    override init(legs: Int = 4) {
        super.init(legs: legs)
    }
    
    func speak() {
        print("Woof!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int = 4, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof! I'm a Corgi.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Woof! I'm a Poodle.")
    }
}

class Persian: Cat {
    init(isTame: Bool) {
        super.init(legs: 4, isTame: isTame)
    }
    
    override func speak() {
        print("Meow! I'm a Persian.")
    }
}

class Lion: Cat {
     init(isTame: Bool = false) {
        super.init(legs: 4, isTame: isTame)
    }
    
    override func speak() {
        print("Roar! I'm a Lion.")
    }
}

// Example usage:
let corgi = Corgi()
let poodle = Poodle()
let persianCat = Persian(isTame: true)
let lion = Lion()

corgi.speak()  // Output: Woof! I'm a Corgi.
poodle.speak() // Output: Woof! I'm a Poodle.
persianCat.speak() // Output: Meow! I'm a Persian.
lion.speak()   // Output: Roar! I'm a Lion.
