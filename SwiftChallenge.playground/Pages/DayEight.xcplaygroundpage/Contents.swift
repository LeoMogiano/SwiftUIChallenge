import Foundation

// Provide default values for params

func printTimesTables(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
print()
// Example of default params

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true) // default value false
// capacity in case do we have a lot information and we need to load again
print(characters.count)
print()
// Handle Errors

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

print()

// Checkpoint 4

//The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer
// square root of that number. That sounds easy, but there are some catches:
//
//You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
//If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
//You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
//If you can’t find the square root, throw a “no root” error.

enum SqrtError: Error {
    case outOfBounds, noRoot, negativeNum
}

func sqrtMogi(num: Int) throws -> Int {
    if num < 0 {throw SqrtError.negativeNum}
    if num > 10_000 {throw SqrtError.outOfBounds}
    
    var result = pow(Double(num),0.5)
    print(result)
    if result.truncatingRemainder(dividingBy: 1) != 0 {
        throw SqrtError.noRoot
    } else {
        return Int(result)
    }
    
}

let numero = - 5

do {
    let result = try sqrtMogi(num: numero)
    print("Password rating: \(result)")
} catch SqrtError.noRoot {
    print("There's no square root for \"\(numero)\".")
} catch SqrtError.outOfBounds {
    print("The number is too much bigger")
} catch SqrtError.negativeNum {
    print("Negative numbers hasn't square root.")
} catch {
    print("There was an error.")
}
