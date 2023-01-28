//: [Previous](@previous)

import Foundation
import Combine


let subject = PassthroughSubject<String, Never>()


// The print() operator prints you all lifecycle events
let subscription = subject.sink { value in
    print("Subscriber received value: \(value)")
}


subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")
subject.send(completion: .finished) // 관계를 끝냄
// ==  subscription.cancel()
subject.send("Hello ?? :(") // completion을 보낸 후 이므로 받을 수 없음


//: [Next](@next)
