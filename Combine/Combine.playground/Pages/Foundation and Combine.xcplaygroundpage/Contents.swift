//: [Previous](@previous)

import Foundation
import Combine
import UIKit



// URLSessionTask Publisher and JSON Decoding Operator

struct SomeDecodable: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!).map { (data: Data, response: URLResponse) in
    return data
}
.decode(type: SomeDecodable.self, decoder: JSONDecoder())




// Notifications

let center = NotificationCenter.default
let alarm = Notification.Name("MyNotification")
let alarmPublisher = center.publisher(for: alarm, object: nil)
let subscription1 = alarmPublisher.sink {_ in
    print("Alarm Received")
}

center.post(name: alarm, object: nil)




// KeyPath binding to NSObject instances

let testLabel = UILabel()
print("text: \(testLabel.text)")

Just(28)
    .map { "Age is \($0)"}
    .assign(to: \.text, on: testLabel)
print("text: \(testLabel.text)")



// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함

let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()

let subscription2 = timerPublisher.sink { time in
    print("time: \(time)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}

//: [Next](@next)
