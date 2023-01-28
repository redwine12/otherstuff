//: [Previous](@previous)

import Foundation
import Combine


let arr = [1, 2, 3].publisher

let q = DispatchQueue(label: "custom")

let subscription = arr

        .subscribe(on: q)
        // operator
        .map { value in
            print("trasform: \(value), thread: \(Thread.current)")
            return value
        }



        .receive(on: DispatchQueue.main)
        // subscriber
        .sink { value in
            print("받은 데이터: \(value), thread: \(Thread.current)")
        }




//: [Next](@next)
