import Foundation
import Combine

// PassthroughSubject
let subTest1 = PassthroughSubject<String, Never>()

subTest1.send("Hello 1")
let subscription = subTest1.sink { value in
    print("sub 1 received value: \(value)")
}

subTest1.send("Hello 1")
subTest1.send("World 1")
//subTest1.value  -  남아있는 값 없음


// CurrentValueSubject
let subTest2 = CurrentValueSubject<String, Never>("기존에 가지고있던 초기의 value")

subTest2.send("Hello 2")

let subscription2 = subTest2.sink { value in
    print("sub 2 received value: \(value)")
}

subTest2.send("Hello 2")
subTest1.send("World 2")
subTest2.value

//let publisher = ["a", "b", "c"].publisher
//publisher.subscribe(subTest1)
