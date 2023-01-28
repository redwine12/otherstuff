//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

//// removeDuplicates
//let words = "hi hi my name is lee"
//    .components(separatedBy: " ")
//    .publisher
//
//words
//    .removeDuplicates() // 반복 안받음
//    .sink { value in
//        print(value)
//    }.store(in: &subscriptions)
//
//

// compactMap
let lists = ["a", "123", "dce", "0.52"].publisher

lists
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)



// ignoreOutput
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: {print("Completed with : \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)



// prefix
let nums = (1...10).publisher

nums
    .prefix(4)  // 4까지만 받겠다
    .sink(receiveCompletion: {print("Completed with : \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)



//: [Next](@next)
