
import Foundation

// Day 13 ........ How to create and use protocols

//func commute(distance: Int, using vehicle: Whatever ){
//    // lots of code here
//}

protocol Vehicle {
    var name: String {get}
    var currentPassenger: Int {get set}
    func estimateTime(for distance: Int)-> Int
    func travel(distance: Int)
    
}

struct Car: Vehicle {
    
    let name = "Car"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int{
        distance / 50
    }
    
    func travel(distance: Int){
        print("I'm driving \(distance) km ")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bycicle: Vehicle {
    let name = "Bycicle"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int{
        distance / 10
    }
    func travel(distance: Int) {
        print("I am cyclying \(distance) km")
    }
}

func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    }else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle],distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km")
    }
}

let car = Car()
commute(distance: 100, using: car)
let bike = Bycicle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)



// Day 13 ------- How to use opaque return types

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())


// Day 13 ------- How to creaate and use extensions

var quote = "   The truth is rarely pure and never simple   "

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

let trimmed = quote.trimmed()
print(trimmed)

let lyrics = """
But I keep cruising
Can´t stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
}

extension Book {
    init(title: String, pageCount: Int){
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Narnia", pageCount: 100)

// Day 13 ------- How to creaate and use protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Jose","Mario","Daniel","Héctor"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")

}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello(){
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
