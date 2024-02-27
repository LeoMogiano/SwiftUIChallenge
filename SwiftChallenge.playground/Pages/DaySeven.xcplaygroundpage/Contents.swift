import Foundation


// Functions Structure

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

print()

let number = 139

if number.isMultiple(of: 2) {
    print("Par")
} else {
    print("Impar")
}

print()

let roll = Int.random(in: 1...20)
print(roll)
print()

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 10)
print()

// Return values from function

let root = sqrt(99)
print(root)
print()


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)
print()

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)
print()


// Return multiple values in a function

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
print()
// other way to get

let (firstName, lastName) = getUser()
print(firstName)
print()

// To remove arguments names

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let finalResult = isUppercase(string)
print(finalResult)
print()
// or customize them

func printTimesTables(for number: Int) {
    for i in 1...10 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
