import Foundation

// Hola Mundo!
/* Comentario */

print("Hola, Swift!")

// Variables

var myString = "Esto es una cadena de texto"
myString = "Cambie el valor Xd"
//myString = 6 // Error
print(myString)

var myString2:String = "Esto es otra cadena de texto2."
print(myString2)

var myInt = 6
myInt = myInt - 7
print(myInt)
print(myInt - 2)

var myInt2: Int = 5
print(myInt2)

var myDouble = 6.5
print(myDouble)

var myFloat: Float = 6.5
print(myFloat)

var myBool = true
myBool = false
print(myBool)

let myConst = "Mi propiedad constante"
//myConst = "xd"
print(myConst)

// Control de Flujo

if myInt == 10 && myString == "Hola" {
    print("El valor es 10")
} else if myDouble == 6.5 {
    print("Xd")
} else {
    print("El valor no es 10")
}

// Lista

var myList = ["Hola", "Mundo", "Xd"]
print(myList)
print(myList[0])
myList.append("Mogi")
print(myList)

// Sets
var mySet: Set = ["Mogi", "Melody", "Messi"]
print(mySet)

//Mapas

var myMap = ["Mogi":23 , "Mogiano":56]
print(myMap)
print(myMap["Mogi"] ?? "No hay edades" )

// Bucles

for value in myList {
    print(value)
}
var index = 0
while index < myList.count {
    print(myList[index])
    index += 1
}

// Funciones

func myFunction()  {
    print("Xd es una función")
}

func funcString() -> String {
    return "Hoooolaa"
}

myFunction()
print(funcString())

// Clases

class Persona {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var myPersona = Persona(name: "Leo", age: 23)
print(myPersona.name)
