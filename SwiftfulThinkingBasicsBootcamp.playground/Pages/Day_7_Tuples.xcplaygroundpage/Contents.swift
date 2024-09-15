

import Foundation


var userName: String = "Hello"
var userIsPremium: Bool = false
var userIsNew: Bool = true

func getUserName() -> String {
    return userName
}

func getUserIsPremium() -> Bool {
    return userIsPremium
}

// Limited to 1 return type
func getUserInfo() -> String {
    let name = getUserName()
    let isPremium = getUserIsPremium()
    
    // do somethin
    return name
    
}

// tuple can combine multiple pieces of data

func getUserInfo2() -> (String, Bool) {
    let name = getUserName()
    let isPremium = getUserIsPremium()
    
    return (name, isPremium)
    
}

var userData1: String = userName
var userData2: (String, Bool, Bool) = (userName, userIsPremium, userIsNew)

let info1 = getUserInfo3()
let name1 = info1.isPremium

func getUserInfo3() -> (name: String, isPremium: Bool) {
    let name = getUserName()
    let isPremium = getUserIsPremium()
    
    return (name, isPremium)
    
}


func getUserInfo4() -> (name: String, isPremium: Bool, isNew: Bool) {

    
    return (userName, userIsPremium, userIsNew)
    
}

func doSomethingWithUserInfo(info: (name: String, isPremium: Bool, isNew: Bool)){
    
}

let info = getUserInfo4()
doSomethingWithUserInfo(info: info)
