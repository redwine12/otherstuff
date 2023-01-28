//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let sub = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Transformed value: \(value)")
    }

numPublisher.send(1)
numPublisher.send(2)


// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let sub2 = stringPublisher
    .filter { $0.contains("a")}
    .sink { value in
        print("Filtered value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("bcd")
stringPublisher.send("cdea")


//: [Next](@next)
