//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest

let strPublisher = PassthroughSubject<String, Never>()
let intPublisher = PassthroughSubject<Int, Never>()
 
strPublisher.combineLatest(intPublisher).sink { (str, num) in
    print("Received : \(str), \(num)")
}

strPublisher.send("a")
intPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")
intPublisher.send(2)

intPublisher.send(1)
intPublisher.send(2)




// Advanced CombineLatest
// 로그인 구현

let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { username, password in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("is it valid? : \(valid)")
    }

usernamePublisher.send("jaylee")
passwordPublisher.send("aaaa1234eeeee")



// Merge - publisher의 타입이 같아야함 ex) int-int / str-str

let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

let mergePublisher = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge : subscription received value : \(value)")
    }






//: [Next](@next)
